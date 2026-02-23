# =============================================================================
# OGM.Insy - AI-Powered Semantic Search and Insights Platform
# Production Dockerfile
# =============================================================================

FROM python:3.11-slim

# Labels for metadata
LABEL maintainer="OGM.Insy Team <support@ogm.insy.com>" \
      version="1.0.0" \
      description="AI-Powered Semantic Search and Insights Platform"

# Install system dependencies required by OGM.Insy
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libpoppler-cpp-dev \
    pkg-config \
    tesseract-ocr \
    tesseract-ocr-eng \
    libtesseract-dev \
    poppler-utils \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Create non-root user for security
RUN useradd --create-home --shell /bin/bash --uid 1000 ogminsy

# Set working directory
WORKDIR /app

# Copy requirements first for better caching
COPY src/app/requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src/app/ .

# Create necessary directories
RUN mkdir -p /app/.streamlit && \
    mkdir -p /app/steps && \
    mkdir -p /app/data

# Set proper permissions
RUN chown -R ogminsy:ogminsy /app

# Switch to non-root user
USER ogminsy

# Expose Streamlit port
EXPOSE 8501

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD python -c "import socket; s=socket.socket(); s.connect(('localhost', 8501))" || exit 1

# Default command to run Streamlit app
CMD ["streamlit", "run", "ogm_insy_v1.py", "--server.port=8501", "--server.address=0.0.0.0"]