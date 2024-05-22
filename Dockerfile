FROM brunneis/python:3.8.3-ubuntu-20.04
WORKDIR /app
COPY . /app
RUN apt-get update && apt-get install -y iputils-ping
RUN pip install --upgrade pip && pip install -r requirements.txt
ADD skvoznaya2.py .
ENTRYPOINT ["python", "skvoznaya2.py"]