# Use an official Python runtime as a parent image
FROM python:3.11.11-alpine@sha256:9ae1ab261b73eeaf88957c42744b8ec237faa8fa0d5be22a3ed697f52673b58a

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]