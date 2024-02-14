FROM eclipse-temurin:17-jdk-alpine
#Below is for installing curl
RUN apk add curl
VOLUME /tmp
EXPOSE 8080
ADD target/springboot-aws-fargate.jar springboot-aws-fargate.jar
ENTRYPOINT ["java","-jar","/springboot-aws-fargate.jar"]