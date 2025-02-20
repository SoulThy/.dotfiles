#!/bin/bash

sudo apt update

for package in $(cat base); do
    sudo apt install -y "$package"  
done
