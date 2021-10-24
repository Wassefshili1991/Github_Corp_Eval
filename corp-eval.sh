#!/bin/bash
mkdir tempd
cp corp-eval.py tempd/.
echo "FROM python" >tempd/Dockerfile
echo "RUN pip install flask" >>tempd/Dockerfile
echo "COPY corp-eval.py /home/myapp/" >>tempd/Dockerfile
echo "EXPOSE 8080" >>tempd/Dockerfile
echo "CMD python3 /home/myapp/corp-eval.py" >>tempd/Dockerfile
cd tempd
docker build -t sampleapp1 .
docker run -t -d -p 8080:8080 --name samplerunning1 sampleapp1
docker ps -a
