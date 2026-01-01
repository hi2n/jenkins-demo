pipeline {
  agent any
  
  stages {

    stage('Checkout Source') {
      steps {
        checkout scm
      }
    }
    
    stage('Build Docker Image') {
      steps {
        sh '''
          docker build -t jenkins-devops-app:latest .
        '''
      }
    }
    
    stage('Deploy Container') {
      steps {
        sh '''
          docker stop devops-app || true
          docker rm devops-app || true

          docker run -d \
            --name devops-app \
            -p 8080:80 \
            jenkins-devops-app:latest
        '''
      }
    }
  }
}
