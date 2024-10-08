FROM ubuntu:22.04

# Set the repository URL as an environment variable
ENV REPO_URL=https://github.com/HathewayWill/WRF-MOSIT.git

# Install dependencies
RUN apt-get update && apt-get install -y build-essential make cmake gcc git wget  python3 python3-dev python3-pip

# Clone the repository
RUN cd $HOME && git clone $REPO_URL WRF-MOSIT

# Set working directory to the cloned repository
WORKDIR $HOME/WRF-MOSIT



# Copy and rename the install script to WRF-MOSIT.sh
COPY ./scripts /scripts
RUN cp /scripts/install.sh ./WRF-MOSIT.sh

# Make all .sh scripts executable
RUN chmod 775 *.sh

RUN pip install python-dateutil

# Run the WRF-MOSIT.sh script and log output
RUN ./WRF-MOSIT.sh

# CMD or ENTRYPOINT to run the container (this can be adjusted based on your needs)
CMD ["bash"]
