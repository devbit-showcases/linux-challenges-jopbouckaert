#!/usr/bin/env bash
echo "Please enter your GitHub username: "
read USERNAME

curl https://github.com/${USERNAME}.keys >> ~/.ssh/authorized_keys