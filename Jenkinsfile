pipeline {
    agent any

    tools {
        maven 'maven-doinstalowany'
    }

    stages {
        stage('Build') {
            steps {
                withMaven(
                    maven: 'maven-doinstalowany'
                ) {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("arktos-joiner-0.0.1-SNAPSHOT")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Wysyłanie obrazu Dockerowego do repozytorium Docker Hub lub innych
                script {
                    docker.withRegistry('https://hub.docker.com', 'credentials-dockerhub') {
                        def dockerImage = docker.build("arktos-joiner-0.0.1-SNAPSHOT")
                        dockerImage.push()
                    }
                }
            }
        }
    }

    post {
        always {
            // Czyszczenie po zakończeniu budowy
            cleanWs()
        }
    }
}