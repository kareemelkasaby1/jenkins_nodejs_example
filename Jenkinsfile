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
                /* groovylint-disable-next-line GStringExpressionWithinString */
                sh "git checkout -f ${params.COMMIT_TAG}"
            }
        }
        stage('build and push') {
            steps {
                /* groovylint-disable-next-line LineLength --*/
                sh "docker build -t kareemelkasaby/vodafonetask1node:${params.COMMIT_TAG} -t kareemelkasaby/vodafonetask1node:latest ."
                /* groovylint-disable-next-line GStringExpressionWithinString */
                sh "docker login -u '$DOCKERHUB_USER' -p '$DOCKERHUB_PASS'"
                sh "docker push kareemelkasaby/vodafonetask1node:${params.COMMIT_TAG}"
                sh 'docker push kareemelkasaby/vodafonetask1node:latest'
            }
        }
    }
}
