pipeline {
    agent any

    environment {
        MONGO_URI = credentials('MONGO_URI')
        FLASK_ENV = credentials('FLASK_ENV')
    }

    stages {
        stage('Checkout Code') {
            steps {
               git branch: 'main', url: 'https://github.com/avneeshdeshmukh/Recipe-blog-with-jenkins.git'
            }
        }

        stage('Create .env File') {
            steps {
                sh '''
                echo "MONGO_URI=${MONGO_URI}" > .env
                echo "FLASK_ENV=${FLASK_ENV}" >> .env
                '''
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh 'pip3 install -r requirements.txt'
                sh 'python3 test.py'
            }
        }

        stage('Build & Deploy Docker Compose') {
            steps {
                sh 'docker-compose down'
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful!'
        }
        failure {
            echo '❌ Deployment Failed!'
        }
    }
}
