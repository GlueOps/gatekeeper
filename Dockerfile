# Use an official Python runtime as a parent image
FROM python:3.13.5-alpine@sha256:610020b9ad8ee92798f1dbe18d5e928d47358db698969d12730f9686ce3a3191

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]