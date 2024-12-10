# Use an official Python runtime as a parent image
FROM python:3.12.8-alpine@sha256:fd340d298d9d537a33c859f03bcc60e8e2542968e16f998bb0e232e25b4b23bd

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]