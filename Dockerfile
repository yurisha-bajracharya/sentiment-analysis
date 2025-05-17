# Use Python 3.13.2 as the base image
FROM python:3.13.2

# Set working directory inside the container
WORKDIR /app

# Copy requirements.txt first for better layer caching. This way, Docker will only reinstall packages if requirements.txt changes
COPY requirements.txt .

# Install dependencies
# --no-cache-dir reduces the image size by not storing the pip cache
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# adding progress bar
# Add --progress-bar=on here
RUN pip install --no-cache-dir --progress-bar=on -r requirements.txt

# Expose port 8000 to allow external connections to the container
EXPOSE 8000

# Command to run when the container starts
# This runs the FastAPI application with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]