FROM alpine:3.17


COPY ./requirements.txt ./requirements.txt

RUN apk add python3
RUN apk add py3-pip
RUN pip install -r requirements.txt

COPY . . 

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
#CMD ["python", "main.py"]
EXPOSE 8000:8000