
Get the clone from the repository using below command
  ```
  git clone https://github.com/sanjeewanie/Xeneta-Operations-Task.git
  ```
  
Make sure your developemnt envirentment have below apllications up and running.
  Docker
  Git
  
if you wish to change postgress mysql user credential you want to change the credentials in   Docker file and the config.py under "rates" folder.
You should navigate to Xeneta-Operations-Task path before build the Docker container.

Build the Docker image
 docker build --tag xeneta-rates . 
 
Run the Docker image to make application server up with Gunicorn master node and we can access the application  running on http://localhost:3000 
 docker run -p 3000:8080 xeneta-rates
 
 
 Here we have used Docker , git , shell scripting to IaaC..
 


  
  
