#!/bin/bash
docker run -d -it \
    --name rabbitmq \
    --restart=always \
    -p 15672:15672 \
    -p 5672:5672 \
    rabbitmq:management
