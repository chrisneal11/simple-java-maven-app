pipeline {
    agent {
        docker {
            image 'chrisneal11/project1'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
       stage(‘Building_Image’) {
          steps{
             script {
//                dockerImage = docker.build registry + “$BUILD_NUMBER”
                dockerImage = docker.build imagename
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

//   End my paste






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
