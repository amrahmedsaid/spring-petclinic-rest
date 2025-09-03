pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code...'
            }
        }
        
        stage('Build Image') {
            steps {
                script {
                    docker.build("amrsaid172/spring-petclinic-rest:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
                        docker.image("amrsaid172/spring-petclinic-rest:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
