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
          ansible-playbook ansible/deploy.yml \
          -i ansible/inventory \
          --extra-vars "image_name=${IMAGE_NAME} image_tag=${IMAGE_TAG} env=${DEPLOY_ENV}"
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
