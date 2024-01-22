#Use the base image with Python 3.11
FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Install Chrome or Chromium browser
#RUN apt-get update && apt-get install -y chromium

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . /app/

# Set the environment variable to include /app in the PATH
ENV PATH="/app:${PATH}"

EXPOSE 80

# Set the command to run when the container starts
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]

