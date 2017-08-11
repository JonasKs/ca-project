#!/bin/bash
docker build -t pythonimage .
docker rm -f pythoncontainer || true
docker run --rm -i -p 5060:5000 --name pythoncontainer pythonimage:latest python /tmp/ca-project/tests.py
docker rm  -f pythoncontainer || true
docker run -d --rm -p 5050:5000 --name pythoncontainer pythonimage:latest python /tmp/ca-project/run.py
