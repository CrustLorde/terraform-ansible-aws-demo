# Use official Python slim image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Set environment variable (optional)
ENV FLASK_ENV=production

# Expose port
EXPOSE 5000

# Start the app
CMD ["python", "app.py"]
