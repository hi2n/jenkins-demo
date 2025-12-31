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
        echo "=== Source Code ==="
        ls -la

        echo "=== Build Docker Image ==="
        docker build -t jenkins-devops-app .

        echo "=== Docker Images ==="
        docker images
        '''
      }
    }
  }
}
