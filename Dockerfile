# Use an official Python runtime as a parent image
FROM python:3.14.3-alpine@sha256:e43b76c7e4a8a4621f4e84fd76e0dfb473eda5cc05fc58b2d4d640338eda48b1

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]