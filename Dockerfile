FROM alpine:3.17
#COPY . /src
#COPY ./requirements.txt /src/requirements.txt
#WORKDIR .
#RUN apk add python3
#RUN apk add py3-pip
#RUN pip install -r requirements.txt
#EXPOSE 8000:8000
#CMD ["src/uvicorn main:app --reload" ]
#FROM python:3.6
COPY . . 
COPY ./requirements.txt ./requirements.txt
RUN apk add python3
RUN apk add py3-pip
RUN pip install -r requirements.txt

EXPOSE 8000:8000
RUN pip3 install -r requirements.txt
CMD ["python3", "main.py"]