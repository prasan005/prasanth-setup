#!/bin/bash

# Exit if any command fails
set -e

# Install Java (required for Maven)
sudo dnf install -y java-17-amazon-corretto

# Verify Java
java -version

# Go to /opt (standard location for optional software)
cd /opt

# Download latest Maven (update version if newer available)
sudo  wget https://dlcdn.apache.org/maven/maven-4/4.0.0-rc-5/binaries/apache-maven-4.0.0-rc-5-bin.tar.gz
# Extract
sudo tar -zxvf apache-maven-4.0.0-rc-5-bin.tar.gz

# Rename for simplicity
sudo  mv apache-maven-4.0.0-rc-5 maven

# Remove tar file
sudo rm -f apache-maven-4.0.0-rc-5-bin.tar.gzc

# Set environment variables
echo "export M2_HOME=/opt/maven" | sudo tee /etc/profile.d/maven.sh
echo "export PATH=\$M2_HOME/bin:\$PATH" | sudo tee -a /etc/profile.d/maven.sh

# Give execute permission
sudo chmod +x /etc/profile.d/maven.sh

# Load environment
source /etc/profile.d/maven.sh

# Verify installation
mvn -version
