# Use Python 3.6 or later as a base image
FROM python:3.10

#Set working directory
WORKDIR /app

# Copy contents into image
COPY app.py requirements.txt /app/

# Install pip dependencies from requirements
RUN pip install -r requirements.txt

# Set YOUR_NAME environment variable
ENV YOUR_NAME="JACK_BUCK"

# Expose the correct port
EXPOSE 5000

# Create an entrypoint
ENTRYPOINT ["python", "app.py"]
