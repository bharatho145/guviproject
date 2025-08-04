pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
 	        script {
		    echo "Building branch: ${env.GIT_BRANCH}"
	            if (env.GIT_BRANCH == 'dev') {
		        echo "====Checkout Dev repo ====="
			checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/bharatho145/guviproject.git']])
		    } else if (env.GIT_BRANCH == 'prod') {
                        echo "This is the production branch"
			checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/bharatho145/guviproject.git']])
                        // Add develop branch-specific build steps here
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

