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
                bat 'echo %DOCKERHUB_CREDENTIALS_PASSWORD% | docker login -u %DOCKERHUB_CREDENTIALS_USERNAME% --password-stdin'
            }
        }
        stage('Docker Push image') {
            steps {
                bat 'docker push harmit179/jenkins-docker-hub'
           }
        }
    }
}
