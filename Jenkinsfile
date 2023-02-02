pipeline {

    agent any

    stages {

        stage('Scan') {
        
            /*agent {
                docker {
                    image 'sonarqube:8.5.1-community'
                    // Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely:
                    reuseNode true
                }
            }*/
            steps {
                
                script {
                    def scannerHome = tool 'sonarqube';
                    withSonarQubeEnv() {
                        
                        sh "${scannerHome}/bin/sonar-scanner --version"
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