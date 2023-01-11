pipeline {

    agent any

    stages {
  
        stage('Build') {
            steps {
                echo 'Build Stage'
                sh 'docker build -t pyapp-image .'
            }
        }
        //stage('Security Scan') {
        //    steps {
        //        sh 'docker run --rm --net=host -v ${PWD}:/sonarqube-flask sonarsource/sonar-scanner-cli sonar-scanner -D sonar.projectBaseDir=/sonarqube-flask'
        //    }
        //}
        stage('Test') {
            steps {
                echo 'Test workflow still a work in progress.'
                sh 'docker run --rm --net=host -v ./data:/fast-api-app  sonarqube:8.5.1-community sonar-scanner -D sonar.projectBaseDir=/app'
                //echo 'Waiving Test Stage'
                //sh 'docker run -d --name pyapp-container pyapp-image'
                //sh 'RETVAL=${?}'
                //sh 'docker ps -a'
                //sh 'docker cp pyapp-container:./result.xml result.xml'
                //sh 'docker rm -f pyapp-container'
                //sh 'ls -al ./result.xml'
                //sh 'exit ${RETVAL}'
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