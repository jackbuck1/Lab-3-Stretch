# Use Python 3.6 or later as a base image
FROM python:3.8

#Set working directory
WORKDIR /app

# Copy contents into image / include . ignore args next time
COPY . .

# Install pip dependencies from requirements
RUN pip install -r requirements.txt

# Set YOUR_NAME environment variable
ENV YOUR_NAME="JACK_BUCK"

# Expose the correct port
EXPOSE 5500

# Create an entrypoint
ENTRYPOINT ["python", "app.py"]
