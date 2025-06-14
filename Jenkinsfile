pipeline {
    agent any
    stages {
        stage('Code') {
            steps {
                echo 'Cloning from GIT'
                git branch: 'master', url: 'https://github.com/Paritoshgh/Webpage.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building'
                sh 'docker build . -t ghadgeparitosh10/webpage:latest'
            }
        }
        stage('Push') {
            steps {
                echo 'Push Image to Docker Hub'
                withCredentials([
                usernamePassword(
                credentialsId: 'DockerHub',
                passwordVariable: 'DockerHubPassword',
                usernameVariable: 'DockerHubUser'
                )]) {
                    sh "docker login -u ${env.DockerHubUser} -p ${env.DockerHubPassword}"
                    sh 'docker push ghadgeparitosh10/webpage:latest'
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
                }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to PROD'
                sh 'docker compose down && docker compose up -d'
            }
        }
    }
}