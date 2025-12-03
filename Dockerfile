# Use an official Python runtime as a parent image
FROM python:3.14.1-alpine@sha256:4f699e4afac838c50be76deac94a6dde0e287d5671fd8e95eb410f850801b237

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]