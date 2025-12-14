# Use official Python 3.11 slim image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy dependencies first (for caching)
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose the port your app runs on
EXPOSE 8080

# Set default environment variable for Flask
ENV PORT=8080

# Run Flask app with production server (Gunicorn)
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
