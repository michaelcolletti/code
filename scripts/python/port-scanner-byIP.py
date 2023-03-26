#!/usr/bin/env python3 

import socket
import sys
from termcolor import colored

# Define the target host and port ranges
target_host = input("Enter the target host IP address: ")
#port_ranges_file = input("Enter the name of the text file containing the port ranges: ")
port_ranges_file = "ports.txt"

# Load the port ranges from the text file
port_ranges = []
with open(port_ranges_file) as f:
    for line in f:
        line = line.strip()
        if "-" in line:
            start, end = map(int, line.split("-"))
            port_ranges += range(start, end + 1)
        else:
            port_ranges.append(int(line))

# Loop over the port ranges and attempt to connect to each port on the target host
for port in port_ranges:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(1)
    result = sock.connect_ex((target_host, port))
    if result == 0:
        print(colored(f"Port {port} is open", "green"))
    else:
        print(colored(f"Port {port} is closed", "red"))
    sock.close()

