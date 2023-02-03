pipeline {

    agent any

    stages {

        stage('Scan') {
            steps {
                script {

                    def scannerHome = tool 'sonarqube';
                    withSonarQubeEnv() {
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=fast-api-app -Dsonar.sources=. -Dsonar.host.url=http://192.168.0.116:9000 -Dsonar.login=e139841e7a701c8e197e5722f1079ede03401c2d -X"
                    }
                }

                script { 

                    echo 'getting result'
                    final String url = "http://192.168.0.116:9000/api/qualitygates/project_status?projectKey=fast-api-app > status.json"
                    final def (String response, int code) = sh(script: "curl -s $url -w '\\n%{response_code}'", returnStdout: true).trim().tokenize("\n")
                    echo response

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