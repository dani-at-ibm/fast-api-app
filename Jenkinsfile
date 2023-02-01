pipeline {

    agent any

    stages {
        stage('Initial') {
            steps {
                sh 'ls'
            }
            /*agent {
                docker {
                    image 'python:3-alpine'
                }
            }*/
            /*steps {
                withEnv(["HOME=${env.WORKSPACE}"]) {
                    sh 'pip install --user -r requirements.txt'
                    sh 'py.test --cov-report xml:coverage.xml --cov=. --junitxml=result.xml'
                }
            }*/
        }
        stage('sonar-scanner') {
            //withCredentials([string(credentialsId: 'sonar', variable: 'sonarLogin')]) {
            //sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.projectKey=fast-api-app -Dsonar.sources=. -Dsonar.host.url=https://sonarqube:9000 -Dsonar.login=${sonarLogin}"
            //sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.projectKey=fast-api-app -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=e139841e7a701c8e197e5722f1079ede03401c2d"
            //}
            steps {
                def sonarqubeScannerHome = tool name: 'sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.projectKey=fast-api-app -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=e139841e7a701c8e197e5722f1079ede03401c2d"           
            }
            //sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.projectKey=fast-api-app -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=e139841e7a701c8e197e5722f1079ede03401c2d"   
        }        
        /*stage('SonarQube analysis') {
            def scannerHome = tool 'SonarScanner 4.0';
            withSonarQubeEnv('My SonarQube Server') { // If you have configured more than one global server connection, you can specify its name
            sh "${scannerHome}/bin/sonar-scanner"
            }
        }*/
        stage('Test') {
            steps {
                //sh '${env.SONAR_HOST_URL}'
                sh 'py.test --cov-report xml:coverage.xml --cov=. --junitxml=result.xml'
                sh 'sonar-scanner -v'
                
  /*              sh 'sonar-scanner \
  -Dsonar.projectKey=fast-api-app \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=d9912ad659ee66a4935d63f0ff3a42a6242111d7'*/
            }
        }  
        stage('Build') {
            steps {
                sh 'docker build -t pyapp-image .'
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