pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/bharatho145/guviproject.git']])
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
                sh 'docker push bharath145/dev_repo_guvitask'
                }
            }
        }
    }
}

