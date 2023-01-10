FROM alpine:3.17

WORKDIR /src

COPY ./requirements.txt /src/requirements.txt

RUN apk add python3
RUN apk add py3-pip
RUN pip install -r /src/requirements.txt --ignore-installed packaging

COPY . /src 

CMD ["pytest", "--junitxml=''result.xml"]

RUN find . -name "result.xml"

RUN pwd

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
#CMD ["pytest", "--junitxml=''result.xml"]
EXPOSE 8000:8000