FROM alpine:3.17
COPY . . 
COPY ./requirements.txt ./requirements.txt
RUN apk add python3
RUN apk add py3-pip
RUN pip install -r requirements.txt
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
EXPOSE 8000:8000