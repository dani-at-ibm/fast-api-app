import groovy.json.JsonSlurperClassic
import groovy.json.JsonOutput

pipeline {

    agent any

    environment {
        HOST_IP = "192.168.0.116"
        PROJECT_TOKEN = "e139841e7a701c8e197e5722f1079ede03401c2d"
        PROJECT_KEY = "fast-api-app"
    }

    stages {

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
                    //def data = new JsonSlurperClassic().parseText(response)
                    //echo "${data.projectStatus.status}"
                    //def data = readJSON text: response;
                    echo response;

                    /*echo 'getting sonar status'
                    sh "curl -X GET -H 'Accept: application/json' http://192.168.0.116:9000/api/qualitygates/project_status?projectKey=fast-api-app > status.json"
                    def json = readJSON file:'status.json'
                    echo "${json.projectStatus.status}"
                    if ("${json.projectStatus.status}" == "ERROR") {
                        currentBuild.result = 'FAILURE'
                        error('Failed quality gates.')
                    }*/
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