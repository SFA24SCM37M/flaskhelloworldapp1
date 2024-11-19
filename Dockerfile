# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables in the correct format
ENV PORT=80
ENV HOST=0.0.0.0

# Expose the desired port
EXPOSE 80

# Install dependencies (use --no-cache-dir to avoid caching pip dependencies)
RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    rm -rf /var/lib/apt/lists/*  # Clean up apt cache to reduce image size

# Set the working directory to /app
WORKDIR /app

# Copy only the requirements file to avoid unnecessary installs when app code changes
COPY ./requirements.txt /app/requirements.txt

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the application code
COPY . /app

# Define the command to run the application
ENTRYPOINT ["python", "app.py"]
