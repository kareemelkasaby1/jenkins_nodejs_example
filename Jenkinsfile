/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    parameters {
        string(name: 'COMMIT_TAG')
    }
    stages {
        stage('cloning and checkout') {
            steps {
                echo "Hello ${params.COMMIT_TAG}"
                sh 'git pull https://github.com/kareemelkasaby1/jenkins_nodejs_example k8s_task'
                /* groovylint-disable-next-line GStringExpressionWithinString */
                sh "git checkout -f ${params.COMMIT_TAG}"
            }
        }
        stage('build and push') {
            steps {
                sh "docker build -t kareemelkasaby/vodafonetask1node:${params.COMMIT_TAG} ."
                /* groovylint-disable-next-line GStringExpressionWithinString */
                sh "docker login -u '$DOCKERHUB_USER' -p '$DOCKERHUB_PASS'"
                sh "docker push kareemelkasaby/vodafonetask1node:${params.COMMIT_TAG}"
            }
        }
    }
}
