pipeline {
    
    agent any
    stages{
	stage ('checkout') {
	    steps{
		    //git url: 'https://github.com/raamstar/simple-reactjs-app.git'
		    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/raamstar/simple-reactjs-app.git']]])
	}
	}
	    
	stage('Submit Stack') {
            steps {
		    script{
			
			    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key-new1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
			    // withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AKIAXA633C7CVYMMLNP3', credentialsId: 'AWS-IAM', secretKeyVariable: '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']]) 
		    // {
		     bat "aws cloudformation create-stack --stack-name s3bucket --template-body file://stack.json --region 'us-east-1'"
		     sh "sudo -su"	    
		     sh "apt-get update -qq"
        	     sh "apt-get install -y apt-transport-https ca-certificates"
                     sh "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"
                     sh "echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list"
                     sh "apt-get update -qq"
                     sh "apt-get purge lxc-docker || true"
                     
         	     sh "apt-get -y install docker-engine"
        	     sh "usermod -aG docker ubuntu"
        	     sh "mkdir -p /etc/systemd/system/docker.service.d"
        	   
        	     sh "systemctl daemon-reload"
                     sh "systemctl restart docker"
        	     sh "git init"
        	     sh "git clone https://github.com/raamstar/simple-reactjs-app.git"
        	     sh "docker build . -t react-app"
        	     sh "docker run react-app"    
		   }
		 }	    
              }
          }    
  }
}
