#Image base
FROM python:3.9
#Allows logs messages
ENV PYTHONUNBUFFERED 1
#Create docker workdir
WORKDIR /back
#Upgrade Pip
RUN pip install --upgrade pip

#Copy requirements to docker workdir
COPY requirements.txt /back/
#Install requierements
RUN  pip install -r requirements.txt
#Copy all to container folder
COPY . ./

#Commands for start app
 CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000"]