// Christopher Neal's Project1 Jenkins file
node {
  
  stage('Checkout Source Code') {
    checkout scm
  }

  stage('Create Docker Image') {
    docker.build("docker_image:${env.BUILD_NUMBER}")
  }

  stage ('Run Application') {
    try {
      // Stop existing Container
      sh 'docker rm project1 -f'
      // Start database container here
      sh "docker run -d --name project1 docker_image:${env.BUILD_NUMBER}"
    } 
	catch (error) {
    } finally {
      // Stop and remove database container here
      
    }
  }
  
//  stage ('Notifications') {
//    mail body: "Project Execution Completed with status : " + currentBuild.result ,
//                     subject: 'Project Execution Notification',
//                     to: 'abc@abc.com'
//     }
 }
