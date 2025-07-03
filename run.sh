#!/bin/bash

echo "Starting port-forwarding..."
kubectl port-forward svc/web-app-service 8888:80 -n web-app &
sleep 2

echo "Starting ngrok tunnel..."
ngrok http 8888

~                                                                               
~                                                                               
~                                                                               
~                                                    
