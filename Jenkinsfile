pipeline {
    agent any
    stages {
  
        stage('Build') {
       
            steps {
                //sh 'apk add python3'
                //sh 'apk add py3-pip'
                //sh 'pip install -r requirements.txt'
                //sh 'echo $USER'
                //sh 'groupadd -g 998 docker'
                sh 'usermod -a -G docker root'
                //sh 'docker build -t pyapp:0.1.'
                //echo 'Building'
            }
              
                
        }
        stage('Docker Push') {

      steps {
      	withCredentials([usernamePassword(credentialsId: 'pdiose', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) 
        {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
           // sh 'docker push shanem/spring-petclinic:latest'
        }
      }

    }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                //sh 'python3 main.py'
                //sh 'uvicorn main:app --port 8000'
                sh 'docker run -p 8000:8000 -t pyapp -i pyapp'
                //echo 'Deploying'
            }
        }
    }
}
