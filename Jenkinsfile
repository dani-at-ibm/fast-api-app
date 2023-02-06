pipeline {

    agent any

    environment {
        HOST_IP = "192.168.0.116"
        PROJECT_TOKEN = "e139841e7a701c8e197e5722f1079ede03401c2d"
        PROJECT_KEY = "fast-api-app"
        WORKSPACE = pwd()
    }

    stages {

        stage ('Test') {
            agent {
                docker { 
                    image 'maven:3-alpine'
                    reuseNode true
                }
            }
            steps {
                sh 'mvn --version'
            }
        }

        stage('Scan') {

            steps {

                script {
                    def scannerHome = tool 'sonarqube';
                    withSonarQubeEnv() {
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=${PROJECT_KEY} -Dsonar.sources=. -Dsonar.host.url=http://${HOST_IP}:9000 -Dsonar.login=${PROJECT_TOKEN} -X"
                    }
                }

                script {
                    final String url = "http://${HOST_IP}:9000/api/qualitygates/project_status?projectKey=${PROJECT_KEY}"
                    final String response = sh(script: "curl -s $url", returnStdout: true).trim()
                    def data = readJSON text: response;
                 
                    if ("${data.projectStatus.status}" == "ERROR") {
                        currentBuild.result = 'FAILURE'
                        error('Failed quality gates.')
                    }
                }
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t pyapp-image .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d --name pyapp-container -p 8000:8000 pyapp-image'
            }
        }
    }
}