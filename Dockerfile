FROM python:3.10-slim

WORKDIR /app

# Install requirements
COPY src/api/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code and models generated in the workflow
COPY src/ /app/src/
COPY models/ /app/models/

# Expose FastAPI port
EXPOSE 8000

# Set pythonpath to locate api files, while keeping cwd as /app
ENV PYTHONPATH=/app/src/api
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
