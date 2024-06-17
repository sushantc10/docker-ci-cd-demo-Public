# Use the official Python image from Docker hub as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

#copy the content of the local src directory to the working directory

COPY src/ .
RUN adduser myappuser
RUN chown myappuser. /app -R
USER myappuser

EXPOSE 5000

#Specify the command to run on container start
CMD ["python","./app.py"]