# Use a Debian base image
FROM debian:latest

# Install required packages: build tools, CMake, and any dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    libc6-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY . /app

# Create a build directory
RUN mkdir build

# Change to the build directory
WORKDIR /app/build

# Configure the build and generate the makefiles
RUN cmake ..

# Build the shared library
RUN make

# Optionally, install the shared library (e.g., to /usr/local/lib)
RUN make install

# Set the environment variables if needed
ENV LD_LIBRARY_PATH /usr/local/lib

# Optionally, clean up source code or other files that are not needed in the final image
WORKDIR /
RUN rm -rf /app
