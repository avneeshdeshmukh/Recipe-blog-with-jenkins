FROM jenkins/jenkins:lts

# Switch to the root user to install software
USER root

# Install Python and other necessary tools
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Switch back to the jenkins user
USER jenkins