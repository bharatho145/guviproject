#! /bin/bash

docker image tag bharath145/dev_repo_guvitask:latest bharath145/prod_repo_guvitast:latest

docker push bharath145/prod_repo_guvitask:latest
