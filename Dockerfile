# Use a minimal base image
FROM python:3.8-slim

# Set a working directory
WORKDIR /app

# Copy only the necessary files
COPY app.py requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt && \
    apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Drop privileges by creating a non-root user
RUN useradd -m appuser
USER appuser

# Expose the application port
EXPOSE 5000

# Define environment variables
ENV PYTHONUNBUFFERED=1

# Command to run the application
CMD ["python", "app.py"]
