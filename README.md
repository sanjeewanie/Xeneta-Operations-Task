Get the clone from the repository using below command
  git clone https://github.com/sanjeewanie/Xeneta-Operations-Task.git
  
Make sure your developemnt envirentment have below apllications up and running.
  Docker
  Git
  
if you wish to change postgress mysql user credential you want to change the credentials in   Docker file and the config.py under "rates" folder.

 docker run -p 3000:8080 xeneta-rates
 docker build --tag xeneta-rates .


  
  
