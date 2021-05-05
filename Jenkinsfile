pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        checkout scm
      }
    }
    stage('Building Image') {
      steps {
        sh "docker build -t octumn/jdockerfile:v1.0.$BUILD_NUMBER ."
      }
    }
    stage('Pushing Image') {
      steps{
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'usr', passwordVariable: 'pwd')]) {
            sh "docker login --username=$usr --password='$pwd' docker.io"
            sh "docker push octumn/jdockerfile:v1.0.$BUILD_NUMBER"
        }
      }
    }
  }
}
