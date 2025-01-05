# Use an official Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy requirements.txt into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 8090 5000 8080

# Run multiple commands with a shell script
# Gunicorn for Flask app and FileStream script run in parallel
CMD gunicorn -w 4 -b 0.0.0.0:8090 app:app & python3 -m FileStream
