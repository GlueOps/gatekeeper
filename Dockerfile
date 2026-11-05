# Use an official Python runtime as a parent image
FROM python:3.15.2-alpine@sha256:d499023466546cd88a358f80b46fba4016f32597bc4482bb1c47b483a07d457d

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]