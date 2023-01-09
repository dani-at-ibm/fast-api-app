FROM alpine:3.17

COPY . . 
COPY ./requirements.txt ./requirements.txt


#USER root
#ARG DOCKER_GID=998

#RUN groupadd -g ${DOCKER_GID} docker
#RUN usermod -a -G docker jenkins

RUN apk add python3
RUN apk add py3-pip
RUN pip install -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

EXPOSE 8000:8000