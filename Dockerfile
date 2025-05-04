FROM hrishi2861/terabox:heroku

# Create a non-root user with UID 10014 (as suggested)
RUN adduser --disabled-password --gecos '' --uid 10014 appuser

# Set working directory
WORKDIR /app

# Use non-root user
USER appuser

# Copy requirements and install
COPY requirements.txt .
RUN uv pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose port for Choreo
EXPOSE 8000

# Start the app
CMD ["bash", "start.sh"]
