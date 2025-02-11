FROM python:3.11-slim

WORKDIR /app

# Copy requirements first for better layer caching
COPY script.py .

# Run the application
CMD ["python", "script.py"]

