pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
 	        script {
	            if (env.BRANCH_NAME == 'dev') {
		        echo "====Checkout Dev repo ====="
			checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/bharatho145/guviproject.git']])
		    } else if (env.BRNAHC_NAME == 'prod') {
		        echo "====Checkout Prod repo===="
			checkout scmGit(branches: [[name: '*/prod']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/bharatho145/guviproject.git']]
		    }
				
		}  
            }
        }
        stage('Build Docker Image'){
            steps {
                sh './build.sh'
            } 
        }
        stage ('Push to Docker Hub'){
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                sh 'docker login -u bharath145 -p ${dockerhubpwd}'
                sh './deploy.sh'
                }
            }
        }
    }
}

