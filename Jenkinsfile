pipeline {
    agent any
    tools {
        maven 'Maven-3.8'
        jdk 'JDK-11'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/spring-petclinic/spring-petclinic-rest.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    def appImage = docker.build("petclinic-backend:${BUILD_NUMBER}")
                    appImage.push()
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run --rm -d --name petclinic-backend -p 8081:8080 petclinic-backend:${BUILD_NUMBER}'
            }
        }
    }
}
