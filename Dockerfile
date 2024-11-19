# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables in the correct format
ENV PORT=80
ENV HOST=0.0.0.0

# Expose the desired port
EXPOSE 80

# Update apt-get and install python3-pip
RUN apt-get update -y && \
    apt-get install -y python3-pip

# Copy the requirements file into the container at /app
COPY ./requirements.txt /app/requirements.txt

# Set the working directory to /app
WORKDIR /app

# Install dependencies from the requirements file
RUN pip install -r requirements.txt

# Copy the entire project into the container
COPY . /app

# Define the command to run the application
ENTRYPOINT ["python", "app.py"]
