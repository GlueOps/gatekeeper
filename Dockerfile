# Use an official Python runtime as a parent image
FROM python:3.14.9-alpine@sha256:d55673c233e28839c1c0c69766428cb6d50174a2ecfdcf915b6f58a0b0991562

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]