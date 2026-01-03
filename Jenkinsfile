pipeline {
  agent any
    
  environment {
      IMAGE_NAME = "jenkins-devops-app"
      IMAGE_TAG = "latest"
      DEPLOY_ENV = "staging"
  }
  
  stages {

    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
      }
    }
    
    stage('Test') {
      steps {
        sh '''
          chmod +x test.sh
          ./test.sh
        '''
      }
    }

    stage('Deploy with Ansible') {
      steps {
        sh '''
          ./scripts/run-deploy.sh \
          $IMAGE_NAME \
          $IMAGE_TAG \
          $DEPLOY_ENV
        '''
      }
    }  
  }
    post {
      success {
        echo " Pipeline SUCCESS "
      }
      failure {
        echo " Pipeline FAILED - DEPLOY ABORTED"
      }
   }
}
