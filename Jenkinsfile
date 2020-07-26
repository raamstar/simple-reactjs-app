pipeline {
    
    agent any
    stages{
	stage ('checkout') {
	    steps{
	git url: 'https://github.com/raamstar/simple-reactjs-app.git'
	}
	}
	    
	stage('Submit Stack') {
            steps {
		    script{
                     sh "aws cloudformation create-stack --stack-name s3bucket --template-body file://stack.json --region 'us-east-1'"
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
        	     sh "printf "[Service]\nExecStart=\nExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375\n" >>  /etc/systemd/system/docker.service.d/docker.conf"
        	     sh "systemctl daemon-reload"
                     sh "systemctl restart docker"
        	     sh "git init"
        	     sh "git clone https://github.com/raamstar/simple-reactjs-app.git"
        	     sh "docker build . -t react-app"
        	     sh "docker run react-app"    
		   }
              }
          }    
	
	
	stage('compile result')
	{
	    steps{
	        script{
	    def node = tool name: 'node'}
	    
	    sh '''
	           docker build -t plmnko098/check .
	       
	           
	     '''
	    
	    }
	}
	stage('pushing the images')
	{
	    steps{
	        script{
	            sh '''
	            
	            docker push plmnko098/check
	            docker run -d --name=check -p 3000:3000 plmnko098/check 
	            '''
	            
	        }
	    }
	}
	
	
    }
}
