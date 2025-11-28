pipeline {
    agent any

    environment {
        IMAGE_NAME = "techmayu/node-ci-cd"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Techmayu/hello-world..git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push $IMAGE_NAME"
            }
        }

        stage('Run Container') {
            steps {
                sh "docker stop app || true"
                sh "docker rm app || true"
                sh "docker run -d -p 3000:3000 --name app $IMAGE_NAME"
            }
        }
    }
}
