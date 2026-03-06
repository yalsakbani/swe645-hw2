// This Jenkinsfile defines the CI/CD pipeline for the SWE645 HW2 survey application.
// It automates building a Docker image and deploying it to a Kubernetes cluster.

pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'yalsakba/swe645-hw2:latest'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/yalsakbani/swe645-hw2.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
	stage('Deploy to Kubernetes') {
	    steps {
        	sh 'aws eks update-kubeconfig --name swe645-cluster --region us-east-2'
	        sh 'kubectl apply -f deployment.yaml'
        	sh 'kubectl apply -f service.yaml'
	    }
	}
    }
}