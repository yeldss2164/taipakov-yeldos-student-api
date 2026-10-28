pipeline {
    agent any

    options {
        timestamps()
    }

    environment {
        IMAGE_NAME = 'taipakov-yeldos-student-api'
        IMAGE_TAG = 'jenkins-38321'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Taipakov Yeldos - Checkout completed'
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean assemble -x test --no-daemon'
            }
        }

        stage('Test') {
            steps {
                sh './gradlew test --no-daemon'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }

        stage('Verify') {
            steps {
                sh 'docker image inspect ${IMAGE_NAME}:${IMAGE_TAG}'
                echo 'Taipakov Yeldos - Student API Pipeline SUCCESS'
            }
        }
    }

    post {
        always {
            echo 'Taipakov Yeldos - Pipeline finished'
        }
        success {
            echo 'BUILD SUCCESSFUL - Student ID 38321'
        }
        failure {
            echo 'BUILD FAILED - Check Jenkins console output'
        }
    }
}
