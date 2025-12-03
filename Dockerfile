# Use an official Python runtime as a parent image
FROM python:3.14.1-alpine@sha256:eb37f58646a901dc7727cf448cae36daaefaba79de33b5058dab79aa4c04aefb

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]