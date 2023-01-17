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
                sh 'sonar-scanner sonar-scanner \
  -Dsonar.projectKey=fast-api-app \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=d9912ad659ee66a4935d63f0ff3a42a6242111d7'
                //sh 'docker run --rm --net=host -v {pwd}:/var/jenkins_home  sonarqube:8.5.1-community sonar-scanner -Dsonar.projectKey=fast-api-app -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=c4541d914f9def731e231293076631ed4a0691bf'
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