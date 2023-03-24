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
                docker.withRegistry('https://registry.hub.docker.com', 'dockerhub')
            }
        }
        stage('Docker Push image') {
            steps {
                sh 'docker push harmit179/jenkins-docker-hub'
           }
        }
    }
}
