This spring boot sample project is  deployed in AWS fargate using below steps.

Create spring boot project
Creare  repository in AWS ECR (Elastic Container Registry)
Create buildspec.yml file inside the root folder  of above spring boot project. (This file is used by AWS code build for build the jar file, build the docker image   and then push it into AWS ECR)
Push our source code into git hub
In AWS codebuild, need to create a new project. (While creating this need to provide GIT access token also)
Further need to attached relevant policies for service role which is created  while creating code build project.
Relevant policies means this service role need access to push our docker image to AWS ECR repository.
Then need to create a fargate cluster inside  AWS ECS.
Then need to create the task definition file. (This is like a  template. This will be used by AWS fargate to deploy the application. Here container name in task definition file should be similar to above ECR repository name)
And then service also need to create inside the above fargate cluster which is created by us.

Next AWS codepipeline need to be created. While creating this we need to give relavant GIT repository details, code build project details, code deploy project details(Here while giving deploy provider details need to give simiar our ECS project)


watch below video for more details
https://www.youtube.com/watch?v=ARGmrYFfv44&list=PLnRSa-mtH0ngoyfg7NQ2KlpgEZA2YArH5
