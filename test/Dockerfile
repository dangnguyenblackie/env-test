# Use the base image that contains the gSOAP library
FROM localhost/calc

# Install necessary build tools and libraries
RUN apt-get update && \
    apt-get install -y libssl-dev 

# Set the working directory
WORKDIR /app

# Copy the source code for the new application into the container
COPY . /app

# Create a build directory
RUN mkdir -p build

# Change to the build directory
WORKDIR /app/build

# Configure the build using CMake
RUN cmake ..

# Build the application
RUN make

# Optionally, clean up build tools if they are not needed in the final image
RUN apt-get purge -y --auto-remove build-essential cmake

# Ensure the shared library path is included
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Set the entry point or command to run your application if needed
# CMD ["./main"]
