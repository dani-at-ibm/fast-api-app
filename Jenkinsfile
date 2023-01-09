pipeline {
    
    agent any
   
    stages {
        stage('Build') {
            steps {
                sh "python --version"
                //sh "docker build . -t ${env.PRODUCT}:py"
            }
        }

	// ④ Run the test using the built docker image
        stage('Test') {
            steps {
                script {
                    sh 'echo "test"'
                    //sh "docker run --tty --name ${env.PRODUCT} ${env.PRODUCT}:py /usr/bin/make test"
                }
            }
        }

    	// ⑤ Analyse code quality using previous container as a Docker Container Volume
        stage('Deploy') {
            steps {
             script {
                    sh 'echo "deploy"'
                    //sh "docker run --tty --name ${env.PRODUCT} ${env.PRODUCT}:py /usr/bin/make test"
                }
            }
        }
    }

	// ⑧ Cleanup
    post {
        always {
            script {
                sh 'echo "post clean up"'
            }
        }
    }
}