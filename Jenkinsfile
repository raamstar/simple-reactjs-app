pipeline {
    agent any
    stages{
	stage ('checkout') {
	    steps{
		    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/raamstar/simple-reactjs-app.git']]])
	}
	}
	stage('Build Docker Image'){
        sh 'docker build -t plmnko098/spring-boot-mongo .'
    }    
	
}
}
