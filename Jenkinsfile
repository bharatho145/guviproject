pipeline {
  agent any
  stages {
    stage('for dev branch') {
      when {
        branch 'dev'
      }
      steps {
        echo 'dev branch'
		checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/bharatho145/guviproject.git']])
		sh 'docker build -t bharath145/dev_repo_guvitask . '
		withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                sh 'docker login -u bharath145 -p ${dockerhubpwd}'
                sh 'docker push bharath145/dev_repo_guvitask'
                }
      }
    }
    stage('for prod branch') {
      when {
        branch 'prod'
      }
      steps {
        echo 'prod branch'
		checkout scmGit(branches: [[name: '*/prod']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/bharatho145/guviproject.git']])
		sh 'docker build -t bharath145/prod_repo_guvitask . '
		withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                sh 'docker login -u bharath145 -p ${dockerhubpwd}'
                sh 'docker push bharath145/prod_repo_guvitask'
      }
    }

  }
}
