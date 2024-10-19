from fastapi import FastAPI, Request, HTTPException
from contextlib import asynccontextmanager
import os
import requests

#ENV variables
GITHUB_DISPATCH_URL = os.getenv('GITHUB_DISPATCH_URL')
GITHUB_TOKEN = os.getenv('GITHUB_TOKEN')

@asynccontextmanager
async def lifespan(app: FastAPI):
    """Startup function to test env variables
    crashes if env variables are not set

    Args:
        app (FastAPI)

    Raises:
        Exception: env variables not set
    """
    
    required_env_vars = ["GITHUB_DISPATCH_URL", "GITHUB_TOKEN"]

    for var in required_env_vars:
        if var not in os.environ:
            raise Exception(f"Environment variable {var} is not set.")
    yield

#define the FastAPI app with lifespan
#for startup function
app = FastAPI(lifespan=lifespan)

@app.post("/v1/")
async def trigger_workflow(request: Request):
    """Triggers the workflow if repository created
    Other events are ignored 

    Args:
        request (Request): Incoming webhook from GitHub
    Raises:
        HTTPException: Sends 500 status code if 
        there is an issue in triggering workflow

    Returns:
        string: status message for user
    """
    if "x-github-event" in request.headers:
        if request.headers["x-github-event"] == "repository":
            #get the request body in json
            reqBody = await request.json()
            if 'action' in reqBody:
                if reqBody["action"] == "created":
                    try:
                        status_code = call_github_user_management_workflow()
                        if status_code == 204:
                            return("workflow triggered")
                        raise Exception()
                    except:
                        raise HTTPException(status_code=500, detail="issues triggering workflow")

    return "no workflow triggered"

def call_github_user_management_workflow():
    """Calls the github user management workflow

    Returns:
        int: status code
    """
    # Set the Content-Type header to application/json
    headers = {"Accept": "application/vnd.github+json", "Authorization": f"Bearer {GITHUB_TOKEN}", "X-GitHub-Api-Version": "2022-11-28"}

    # Send POST request with JSON data
    response = requests.post(url=GITHUB_DISPATCH_URL, data='{"ref":"refs/heads/main"}', headers=headers)

    # return the status code
    return response.status_code   