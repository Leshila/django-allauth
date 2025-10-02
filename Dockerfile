FROM python:3.11-slim

WORKDIR /app


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY . .


RUN pip install -e .

EXPOSE 8000

CMD ["python", "example/manage.py", "runserver", "0.0.0.0:8000"]
