pipeline {
   
   environment {
      imagename = 'chrisneal11/project1'
      registryCredential = 'dockerhub'
      dockerImage = ''
  } 

   agent any


   stages {
//  Clone the Git Repository
       stage('Cloning_Git') {
          steps{
             checkout scm
          }
       }
// Build the software from the Git repository
        stage('Build') {
           steps {
              sh 'mvn -B -DskipTests clean package'
           }
        }
// Test the software after building it
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
// Deliver the software after testing it
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
// Build the Docker Image
        stage('Building_Image') {
            steps {
               script {
                   dockerImage = docker.build imagename
               }  
            }
        }
// Deploy the Docker Image
        stage(‘Deploy_Image’) {
          steps {
             script {
                docker.withRegistry( '', registryCredential ) {
                dockerImage.push("$BUILD_NUMBER")
                }
             }  
          }
        }
// Cleanup unused Docker Images
        stage('Remove_unused_Docker_Images') {
            steps {
                sh "docker rmi $imagename:$BUILDNUMBER"
            }
        }
   }
}
