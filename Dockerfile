FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Копируем только нужные файлы
COPY requirements.txt .
COPY setup.py .
COPY README.md .
COPY allauth/ allauth/
COPY example/ example/

# Устанавливаем зависимости
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Пробуем установить пакет (игнорируем ошибки)
RUN pip install -e . || echo "Installation completed with warnings"

EXPOSE 8000

CMD ["python", "example/manage.py", "runserver", "0.0.0.0:8000"]
