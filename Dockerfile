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
COPY --from=builder /opt/hostedtoolcache/Python/3.10.13/x64/lib/python3.10/site-packages /opt/hostedtoolcache/Python/3.10.13/x64/lib/python3.10/site-packages
# Drop privileges by creating a non-root user
RUN useradd -m appuser
USER appuser

# Expose the application port
EXPOSE 5000

# Define environment variables
ENV PYTHONUNBUFFERED=1

# Command to run the application
CMD ["python", "app.py"]
