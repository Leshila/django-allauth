FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install -e .

EXPOSE 8000

CMD ["python", "example/manage.py", "runserver", "0.0.0.0:8000"]
