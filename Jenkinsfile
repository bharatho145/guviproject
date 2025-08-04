pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                        echo "This is the production branch"
			checkout scmGit(branches: [[name: '*/prod']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/bharatho145/guviproject.git']])
                        // Add develop branch-specific build steps here
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

