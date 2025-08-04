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

        stage('Build Docker Image') {
            steps {
                sh 'docker-compose build'
            }
        }

        stage('Run Unit Tests (Inside Docker)') {
            steps {
                sh 'docker-compose run --rm web pytest test.py'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
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
