pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                bat 'docker build -t harmit179/jenkins-docker-hub .'
            }
        }
        stage('Docker Login') {
            steps {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_CREDENTIALS_USERNAME', passwordVariable: 'DOCKERHUB_CREDENTIALS_PASSWORD')]) {
                        bat "echo Logging in to Docker Hub... && docker login --username ${DOCKERHUB_CREDENTIALS_USERNAME} --password ${DOCKERHUB_CREDENTIALS_PASSWORD} ${DOCKER_REGISTRY_URL}"
                    }
            }
        }
        stage('Docker Push image') {
            steps {
                bat 'docker push harmit179/jenkins-docker-hub'
           }
        }
    }
}
