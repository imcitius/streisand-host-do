#!/bin/sh
cd streisand
deploy/streisand-existing-cloud-server.sh --ip-address `cat ../private_ip.txt` --ssh-user root --site-config ../inventory.yml
