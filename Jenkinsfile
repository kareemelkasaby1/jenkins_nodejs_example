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
                sh 'git pull'
                /* groovylint-disable-next-line GStringExpressionWithinString */
                sh "git checkout -f ${params.COMMIT_TAG}"
            }
        }
    }
}