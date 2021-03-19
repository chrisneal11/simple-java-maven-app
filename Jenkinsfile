// Christopher Neal's Project1 Jenkins file
//
//
pipeline {

  environment {
    registry = “chrisneal11/project1”
    registryCredential = ‘dockerhub’
    dockerImage = ‘’
  }
  agent any
//
// Build and test the code
//
  stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
  }
//
//  Create the Docker Image and push it back
//
  stages {
    stage(‘Cloning_Git’) {
      steps {
        git ‘https://github.com/chrisneal11/simple-java-maven-app'
      }
    }
    stage(‘Building_Image’) {
      steps{
        script {
          dockerImage = docker.build registry + “:$BUILD_NUMBER”
        }
      }
    }
    stage(‘Deploy_Image’) {
      steps{
        script {
          docker.withRegistry( ‘’, registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
