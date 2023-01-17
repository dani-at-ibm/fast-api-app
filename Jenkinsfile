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
                sh 'sonar-scanner -v'
  /*              sh 'sonar-scanner \
  -Dsonar.projectKey=fast-api-app \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=d9912ad659ee66a4935d63f0ff3a42a6242111d7'*/
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deployment'
                sh 'docker run -d --name pyapp-container -p 8000:8000 pyapp-image'
            }
        }
    }
}