pipeline {
    agent any
    stages{
	stage ('checkout') 
	    {
	    steps{
		    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/raamstar/simple-reactjs-app.git']]])
	   }
	}
	stage('Build Docker Image'){
		steps{
        sh 'docker build -t plmnko098/simple-react-app .'
		}
    } 
	    stage('pushing image')
   {
       steps{
           script{
       withCredentials([string(credentialsId: 'DockerHubCredentials', variable: 'DockerHubcredentails')]) {
        
    sh "docker login -u plmnko098 -p ${DockerHubcredentails}"
       }
    sh "docker push plmnko098/simple-react-app "
   }
       }
   }
	
}
}
