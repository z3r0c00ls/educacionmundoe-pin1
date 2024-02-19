pipeline {
  agent any

  options {
    timeout(time: 2, unit: 'MINUTES')
  }

  environment {
    ARTIFACT_ID = "elbuo8/webapp:${env.BUILD_NUMBER}"
  }
   stages {
   stage('Building image') {
      steps{
          sh '''
	  pwd
	  ls -ltr
          docker build -t testapp .
             '''  
        }
    }
  
  
    stage('Run tests') {
      steps {
        sh "docker run testapp npm test"
      }
    }
   stage('Deploy Image') {
      steps{
        sh '''
	docker tag educacionmundoe-pin1 mromanolazaro/educacionmundoe-pin1
	docker push mromanolazaro/educacionmundoe-pin1
        '''
        }
      }
    }
}


    
  

