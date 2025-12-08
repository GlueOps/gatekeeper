# Use an official Python runtime as a parent image
FROM python:3.14.2-alpine@sha256:f74e244c26cf94c81a2a6ec8e4e5e55e59bae979063c83382cafb87f03fc1f56

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]