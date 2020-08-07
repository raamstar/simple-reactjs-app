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
	    stage('AWS')
 { steps {
        echo "Creating AWS CloudFormation Stack"
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
		sh 'aws cloudformation create-stack --stack-name petclinic${BUILD_NUMBER} --template-body file://stack.yaml --region us-east-1 --parameters  ParameterKey=SSHKey,ParameterValue=EC2 ParameterKey=ELBVPC,ParameterValue=vpc-977297ea ParameterKey=ELBSubnet,ParameterValue="subnet-9df326c2\\,subnet-25538404"'
        }
 }
	
}
}
