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
            sh "aws cloudformation create-stack --stack-name s3bucket --template-body file://stack.json --region 'us-east-1'"
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
