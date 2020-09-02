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
                /* groovylint-disable-next-line GStringExpressionWithinString */
                sh 'git  checkout -b k8s_task `${params.COMMIT_TAG}`'
            }
        }
    }
}