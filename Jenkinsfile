/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    parameters {
        string(name: 'COMMIT_TAG')
    }
    stages {
        stage('Example') {
            steps {
                echo "Hello ${params.COMMIT_TAG}"
                sh 'git pull https://github.com/kareemelkasaby1/jenkins_nodejs_example k8s_task'
                /* groovylint-disable-next-line GStringExpressionWithinString */
                sh "git checkout -f ${params.COMMIT_TAG}"
            }
        }
    }
}