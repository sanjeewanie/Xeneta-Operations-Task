# The Dockerfile defines the image's environment
# Import Python runtime and set up working directory
FROM python:3
WORKDIR /rates
ADD . /rates



# Install any necessary dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update  && apt-get install -y python3-pip --upgrade pip 


# create a application user 
RUN useradd -ms /bin/bash worker
USER worker
WORKDIR /home/worker

#install dependancies using application user
COPY --chown=worker:worker requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

ENV PATH="/home/worker/.local/bin:${PATH}"
RUN  pip install --user gunicorn 
COPY --chown=worker:worker . .


# install postgresql using root user , given instruction in shell script
COPY script/ .
USER root
RUN  chmod a+w ./ -R
RUN ./postgres_install.sh  

#start postgresql and create postgresql app user with given username and password
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER postgres WITH SUPERUSER PASSWORD 'postgres';" &&\
    createdb -O postgres postgres && \
    psql -h localhost -U postgres < db/rates.sql && \
    psql -h localhost -U postgres -c "SELECT 'alive'"

#switch back to application user to run application
USER worker
ENV PATH="/home/worker/.local/bin:${PATH}"
WORKDIR /home/worker

COPY rates/ .
#RUN  ls -al

# Open port 3000 for serving the webpage

EXPOSE 3000 

CMD ["gunicorn" , "--bind", "localhost:3000" , "wsgi"]


