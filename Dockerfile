FROM hrishi2861/terabox:heroku

WORKDIR /app

# Install dependencies using uv
COPY requirements.txt .
RUN uv pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose the port expected by Choreo (commonly 8000)
EXPOSE 8000

# Start the app
CMD ["bash", "start.sh"]
