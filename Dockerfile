# Use an official Python runtime as a parent image
FROM python:3.12.11-alpine@sha256:9d28d9359a43bdfeb0ca4deb4722b5f88514a4646000b7357f43ee0316e425fa

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]