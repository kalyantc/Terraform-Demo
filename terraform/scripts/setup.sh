#!/bin/bash

sudo apt update
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx

HOST=`hostname`

sudo bash -c "cat > /var/www/html/index.html" <<EOF
<html>
  <head>
    <title>OMES - DevSecOps Workshop</title>
  </head>
  <body>
    <img src="https://raw.githubusercontent.com/kylelee24/omes/main/logo.png"/><br/>
    Hostname: ${HOST}<br/>
  </body>
</html>
EOF
