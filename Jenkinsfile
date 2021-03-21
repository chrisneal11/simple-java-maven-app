pipeline {
    agent {
        docker {
            image 'chrisneal11/project1'
            args '-v /root/.m2:/root/.m2'
        }
    }
  stage('Create_Docker_Image') {
    docker.build("docker_image:${env.BUILD_NUMBER}")
  }
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
