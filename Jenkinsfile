pipeline {
    agent {
        dockerContainer {
            image 'python:3.10'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'python --version'
            }
        }
    }
}
