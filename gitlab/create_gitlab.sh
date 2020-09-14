#!/bin/bash
GITLAB_DIR=/data/gitlab
docker run --detach -it\
    --name gitlab \
    --restart always \
    --privileged=true \
    --publish 7143:443 \
    --publish 7180:80 \
    --publish 7122:22 \
    --volume ${GITLAB_DIR}/config:/etc/gitlab \
    --volume ${GITLAB_DIR}/logs:/var/log/gitlab \
    --volume ${GITLAB_DIR}/data:/var/opt/gitlab \
    gitlab/gitlab-ce
