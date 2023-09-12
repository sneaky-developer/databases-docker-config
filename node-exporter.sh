#!/bin/bash

#apt-get install wget  -y

# Download Node Exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz

# Extract the downloaded archive
tar -xf node_exporter-1.3.1.linux-amd64.tar.gz

# Move the node_exporter binary to /usr/local/bin
sudo mv node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin

# Remove the residual files
rm -r node_exporter-1.3.1.linux-amd64*

# Create a user for node_exporter
sudo useradd -rs /bin/false node_exporter

# Create a systemd unit file for Node Exporter
cat <<EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
After=network.target
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
[Install]
WantedBy=multi-user.target
EOF


#installing systemctl 

#apt-get install systemctl -y

# Reload the systemd daemon
sudo systemctl daemon-reload

# Enable Node Exporter to start at boot
sudo systemctl enable node_exporter

# Start the Node Exporter service
sudo systemctl start node_exporter

# Check the status of Node Exporter
sudo systemctl status node_exporter
