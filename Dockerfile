FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash app
WORKDIR /home/app

COPY --chown=app:app . .

USER app

RUN python -m venv /home/app/venv
ENV PATH="/home/app/venv/bin:$PATH"

RUN pip install --upgrade pip
RUN pip install -e .
RUN pip install django

RUN mkdir -p /home/app/static

RUN cd example && python manage.py migrate --noinput

RUN cd example && echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'adminpassword')" | python manage.py shell || true

EXPOSE 8000

CMD ["python", "example/manage.py", "runserver", "0.0.0.0:8000"]
