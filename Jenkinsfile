pipeline {
    agent any
    stages{
	stage ('checkout') {
	    steps{
		    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/raamstar/simple-reactjs-app.git']]])
	}
	}
	    
	stage('Submit Stack') {
            steps {
		    powershell "echo $env.WORKSPACE"
		    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key-new1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {	     
				    powershell "echo $env.WORKSPACE"
				    powershell "aws cloudformation create-stack --stack-name s3bucket --template-body file://$env.WORKSPACE/stack.json --region 'us-east-1'"
		    }
          }    
  }
}
