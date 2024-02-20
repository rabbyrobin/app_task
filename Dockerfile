# Use a minimal base image
FROM python:3.10-alpine as builder

# Set a working directory
WORKDIR ./

# Copy only the necessary files
COPY app.py config.py requirements.txt /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.10-alpine
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.10/dist-packages /usr/local/lib/python3.10/dist-packages
# Drop privileges by creating a non-root user
RUN useradd -m appuser
USER appuser

# Expose the application port
EXPOSE 5000

# Define environment variables
ENV PYTHONUNBUFFERED=1

# Command to run the application
CMD ["python3", "app.py"]
