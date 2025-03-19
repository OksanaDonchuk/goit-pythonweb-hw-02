# Базовий образ Python
FROM python:3.10-slim

# Встановлення необхідних бібліотек
RUN apt-get update && apt-get install -y libpq-dev gcc

# Створення каталогу для застосунку
WORKDIR /app

# Копіювання файлів
COPY requirements.txt requirements.txt
COPY . .

# Встановлення залежностей
RUN pip install --no-cache-dir -r requirements.txt

# Відкриття порту застосунку
EXPOSE 8000

# Запуск FastAPI-серверу
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
