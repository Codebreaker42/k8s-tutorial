# use a lightweight base image 

FROM python:3.9-slim 

# set env\ironment variable to prevent python from writing .pyl files and buffer output 
ENV PYTHONDONTWRITEBYTECODE=1 
ENV PYTHONUNBUFFERED=1

# set the working directory inside the container 
WORKDIR /app 

# copy only the required files 
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static 

# install python dependecies 
RUN pip install --no-cache-dir -r requirements.txt 

# expose the port the app runs on 
EXPOSE 5000

# run the app 
CMD ["python","app.py"]