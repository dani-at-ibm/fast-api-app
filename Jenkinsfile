pipeline {

    agent any

    stages {
  
        stage('Build') {
            steps {
                sh 'docker build -t pyapp .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -p 8000:8000 -t pyapp -i pyapp'
            }
        }
    }
}