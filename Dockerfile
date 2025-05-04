FROM hrishi2861/terabox:heroku

# Create a non-root user with a UID within the Choreo-accepted range
RUN adduser --disabled-password --gecos '' --uid 10001 choreouser

# Set working directory
WORKDIR /app

# Set ownership of the app directory
COPY . .
RUN chown -R 10001:10001 /app

# Switch to the non-root user
USER 10001

# Install dependencies
RUN uv pip install --no-cache-dir -r requirements.txt

# Expose the default port (adjust if your app uses a different one)
EXPOSE 8000

# Run the start script
CMD ["bash", "start.sh"]
