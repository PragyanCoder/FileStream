FROM python:3.11

USER ..
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt


# Install Python dependencies
# Set the working directory inside the container
WORKDIR /app

# Copy the rest of the project files to the container
COPY . .

# Expose port for the Flask application
EXPOSE 8000
EXPOSE 5000
EXPOSE 8090
# Start both Flask and Gunicorn in a single CMD (use bash to run both commands)
CMD bash -c "flask run -h 0.0.0.0 -p 8090 & gunicorn app:app & python3 -m FileStream"
