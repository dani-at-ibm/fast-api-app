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
                sh 'docker run -d --name pyapp-container pyapp-image'
                sh 'RETVAL=${?}'
                sh 'docker cp pyapp-image:/src/result.xml /result.xml'
                sh 'docker rm -f test_some_module'
                sh 'ls -al ./test_results.xml'
                sh 'exit ${RETVAL}'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d --name pyapp-container -p 8000:8000 pyapp-image'
                //sh 'docker run -p 8000:8000 -t pyapp -i pyapp'
            }
        }
    }
}