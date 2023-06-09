Spring Boot, Mongo DB and Docker container using AWS

its good signup DockerHub


Install Docker in AWS Ubuntu:

	1. Connect to EC2 instance by using SSH client(if using Windows suggested MobaXterm tool)
	2. Sudo apt update -y
	3. Sudo apt install docker.io -u
	
To check docker status:

sudo systemctl status docker


(by default hello-world application) run below command

docker run hello-world

Any permission issue(docker Daemon run always in root user below commad add user(ubuntu) to docker group 

sudo usermod -aG docker ubuntu

. ~/.profile

or

To reflect change you need to restart server

Or

you will have to log out and back in again 

docker run hello-world


Now we need to install MongoDB and Springboot application

1. install and run MangoDB container

pull mongoDB into your EC2 instance

docker pull mongo:latest

MangoDB container downloaded in EC2 instance

Run the MongoDB docker container in EC2:

docker run -d -p 27017:27017 --name <<container name>> mongo:latest
ex: docker run -d -p 27017:27017 --name bujjiMongoDBContainer mongo:latest

To verify bujjiMongoDBContainer running or not:

docker ps

2. install and run SpringBoot app as container in EC2

If you want deploy your own code:
Git clone https://github.com/bujji-vaila/springboot-mongo-docker-demo2.git

 Go to project main folder run below command

syntax:
docker build -t <<springboot app container name>>:<<tag>> .

ex:
docker build -t springboot-mongodb:1.0 .

run below command to show how many images are there in docker  (it will display mondodb image and springboot image)

docker images

now Link springboot- container  and mango db container then run below command:

syntax:
docker run -p <<sprintboot defultport>>:<<sprintboot defultport>> --name  <<Link name>> --link <<MongoDB container name>>:mongo -d <<springboot-container name>>>:<<tag>>

Ex: docker run -p 8080:8080 --name  springboot-mongodb_linkname --link bujjiMongoDBContainer:mongo -d springboot-mongodb:1.0

To check link done and 2 containers running or not

docker ps

To check docker log
Docker logs <<container name>>
Ex: docker logs springboot-mongodb

Kill the containers

Docker rm -f <<container id>>

Connect to mongoDB containr for cmd



2. Docker compose(need extra yaml file(docker-compose.yaml) in resource folder

After added docker-compose.yaml 
Open cmd in resource folder
Docker-.compose up

Both containers started up and running
