FROM nvidia/cuda:12.2.2-runtime-ubuntu22.04

# enable noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive

# install build-essential for gcc and g++
RUN apt update && \
    apt-get install -y python3 python3-pip && \
    apt -y install build-essential

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirments.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV FLASK_APP main.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]
