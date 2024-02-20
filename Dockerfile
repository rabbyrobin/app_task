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
<<<<<<< HEAD
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
=======
COPY --from=builder /opt/hostedtoolcache/Python/3.10.13/x64/lib/python3.10/site-packages /opt/hostedtoolcache/Python/3.10.13/x64/lib/python3.10/site-packages
>>>>>>> 3943dd2bc61bd220c41e88ad9d0e47bd25a22378
# Drop privileges by creating a non-root user
RUN adduser -D appuser
USER appuser

# Expose the application port
EXPOSE 5000

# Define environment variables
ENV PYTHONUNBUFFERED=1

# Command to run the application
CMD ["python", "app.py"]
