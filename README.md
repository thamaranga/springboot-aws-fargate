This spring boot sample project is  deployed in AWS ECS (Using fargate) with below steps.

Create spring boot project
Create  repository in AWS ECR (Elastic Container Registry. This is something like DockerHub)
Create buildspec.yml file inside the root folder  of above spring boot project. (This file is used by AWS code build for build the jar file, build the docker image   and then push it into AWS ECR)
Push our source code into github
In AWS codebuild, need to create a new project. (Here we need to provide our github repo details. For AWS code build to access this repo need to provide GIT access token also)
Further need to attached relevant policies for service role which is created  while creating code build project.
Relevant policies means this service role need access to push our docker image to AWS ECR repository.
Then need to create a fargate cluster inside  AWS ECS. (ECS is something like Kubernates)
Then need to create the task definition file. (This is like a  template. This will be used by AWS fargate to deploy the application. Here container name in task definition file should be similar to above ECR repository name)
And then service also need to create inside the above fargate cluster which is created by us. Simply service is for managing the tasks which are created by our task definitions.

Next AWS codepipeline need to be created. While creating this we need to give relavant GIT repository details, code build project details,  ECS  project details.


watch below video for more details
https://www.youtube.com/watch?v=ARGmrYFfv44&list=PLnRSa-mtH0ngoyfg7NQ2KlpgEZA2YArH5

AWS ECS has 2 launch types
1. EC2 launch type - We have to control the EC2 instances related to our cluster
2. Fargate         - This is a serverless cluster. We don't need to worry  about EC2 instances related to our cluster

While creating AWS ECS below are few important things.

1. ECS Task definition - This means important details about our task like image details, port details of the container and volume details etc.
   So basically using task definition we are creating tasks. Which means we can create multiple tasks using a task definition.
   Let's say our task definition is related to springboot image. Then  if we create multiple tasks from that task definition then
   multiple spring boot docker containers can be run. While creating the service we can mention how many tasks need to run from the task definition file we created.
2. ECS service - This is responsible for keep  the containers which are created using tasks  24*7 run status.
   Which means if  our spring boot container stop since any reason then ECS service is spin up
   new container  by running a new task. So simply our tasks are managed by ECS service.
3. Fargate - This is the EC2 instances cluster which is managed by AWS.

This application we can expose to outside through AWS application load balancer.

Need to create an ALB and two security group. One security group for allowing traffic to load balancer from outside. Another one for allowing traffic from load balancer to ECS.
Then our ECS  need to combine with this ALB.

