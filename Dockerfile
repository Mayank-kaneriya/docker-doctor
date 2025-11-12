FROM ubuntu:22.04

WORKDIR /app

# Copy all files
COPY . /app

# Install Python and dependencies
RUN apt-get clean && apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Install Flask (if your app uses it)
RUN pip3 install flask

# Expose the app port
EXPOSE 8000

# Run the Python application
CMD ["python3", "app.py"]
