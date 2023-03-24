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
                script {
                    bat "echo ${env.DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${env.DOCKERHUB_CREDENTIALS_USR} --password-stdin"
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
