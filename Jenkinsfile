pipeline {

    agent any

    stages {
  
        stage('Build') {
            steps {
                sh 'docker build -t pyapp-image .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker --version'
                sh 'docker run -d --name pyapp-container -p 8000:8000 pyapp-image'
                //sh 'docker run -p 8000:8000 -t pyapp -i pyapp'
            }
        }
    }
}