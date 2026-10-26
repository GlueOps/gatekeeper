# Use an official Python runtime as a parent image
FROM python:3.15.2-alpine@sha256:827d76cd0da4f700a703df95e7a70fec2ecc7fa9fd528638ab2e8aa96fbf8e0e

WORKDIR /app
# Copy the files into the Docker image
COPY main.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# run the app
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]