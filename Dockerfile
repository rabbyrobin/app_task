# Use a minimal base image
FROM python:3.10-alpine as builder

# Set a working directory
WORKDIR /app

# Copy only the necessary files
COPY app.py config.py requirements.txt /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.10-alpine
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
# Drop privileges by creating a non-root user
RUN adduser -D appuser
USER appuser

# Expose the application port
EXPOSE 5000

# Define environment variables
ENV PYTHONUNBUFFERED=1

# Command to run the application
CMD ["python3", "app.py"]
