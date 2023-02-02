pipeline {

    agent any

    stages {

        stage('Scan') {
            steps {
                script {
                    def scannerHome = tool 'sonarqube';
                    withSonarQubeEnv() {
                        sh "${scannerHome}/bin/sonar-scanner --version"
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=fast-api-app -Dsonar.sources=. -Dsonar.host.url=http://192.168.0.116:9000 -Dsonar.login=e139841e7a701c8e197e5722f1079ede03401c2d -X"
                    }
                }
            }
        }
        
        /*stage('sonar-scanner') {

            def scannerHome = tool 'sonarqube';
            withSonarQubeEnv('sonarqube') { // If you have configured more than one global server connection, you can specify its name
                sh "${scannerHome}/bin/sonar-scanner --version"
            }
            steps {
                sh "ls"
            }
        }

        stage('Initial') {
            steps {
                sh 'ls'
                sh 'sonar-scanner -v'
                sh 'sonar-scanner -Dsonar.projectKey=fast-api-app -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=e139841e7a701c8e197e5722f1079ede03401c2d'
            }
        }
        stage('Test') {
            steps {
             
                sh 'py.test --cov-report xml:coverage.xml --cov=. --junitxml=result.xml'
                sh 'sonar-scanner -v'
            }
        }*/

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