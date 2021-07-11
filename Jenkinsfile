pipeline {
    agent { label 'Agent-4' }
    stages {
        stage ('code checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'c0ca3410-0eb6-4700-8a42-337d439e75ce', url: 'https://github.com/vivek4545/warproject.git']]])
            }
        }
        stage ('Build') {
            steps {
            sh 'mvn clean install '
              }
          
        }
        stage ('Copy') {
            steps {
            sh 'scp /apps/jenkin_slave4/workspace/war_pipeline/target/vivek-app.war vk-1@192.168.1.2:/apps/tomcat/webapps/ '
              }
          
        }
        stage ('Create Docker image') {
            steps {
            sh ' sudo docker build -t tomcat_docker:1.0 .'
              }
          
        }
    }
     post {
     always { cleanWs() }
     }
}


    
