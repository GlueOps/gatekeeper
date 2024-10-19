# Use an official Python runtime as a parent image
FROM python:3.11.9-alpine@sha256:1bcefb95bd059ea0240d2fe86a994cf13ab7465d00836871cf1649bb2e98fb9f

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]