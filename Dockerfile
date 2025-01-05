FROM python:3.11


RUN pip install --upgrade pip
RUN pip install -r requirements.txt


# Install Python dependencies
RUN pip3 install wheel \
    && pip3 install --no-cache-dir -U -r requirements.txt

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
