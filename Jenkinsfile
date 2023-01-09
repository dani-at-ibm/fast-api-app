pipeline {
    agent docker {}

    stages {   
        stage('Build') {
            steps {
                sh 'sudo /root/test.sh'
                sh 'groupadd -g 998 docker'
                sh 'usermod -a -G docker jenkins'
                sh 'docker build -t pyapp .'
                //echo 'Building'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -p 8000:8000 -t pyapp -i pyapp'
                //echo 'Deploying'
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}