FROM python:3.12-slim

# this directory will be created in your docker images
WORKDIR /app  
COPY requirements.txt .

# Install dependencies
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

# copy all the files in your current directory to the /app directory in the docker image
COPY . .  

# expose Flask API port
EXPOSE 5001

# “When the container starts, run python app.py.” 
CMD ["python", "app.py"]

# ensure you are in same directory as Dockerfile and run this in your terminal to now build your docker: docker build -t hello-world-mlops:latest .
# after that is done, you can run the container in your terminal  with: docker run -d -p 5001:5001 hello-world-mlops:latest
# to check type docker ps to see the running container, and docker logs <container_id> to see the logs of the container.
# now run this in your terminal to see it's now hitting the docker (notice same port #): 
    # curl -X POST "http://127.0.0.1:5001/predict" -H "Content-Type: application/json" -d '{"features":[5.1,3.5,1.4,0.2]}'