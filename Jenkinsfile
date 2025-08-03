pipeline {
    agent any

    stages {
        stage('Install Python') {
            steps {
            sh '''
                apt-get update
                apt-get install -y python3 python3-pip python3-venv
            '''
            }
        }
        stage('Build') {
            steps {
                sh 'python3 --version'
            }
        }
    }
}
