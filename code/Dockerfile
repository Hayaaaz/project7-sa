FROM python:3.11-slim

WORKDIR /app

# Create non-root user
RUN useradd -m appuser
USER appuser

# Copy requirements first (cache-friendly)
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy app source
COPY app.py .

EXPOSE 8000

CMD ["python", "app.py"]
