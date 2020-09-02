/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    parameters {
        string(name: 'COMMIT_TAG', defaultValue: '')
    }
    stages {
        stage('Example') {
            steps {
                echo "Hello ${params.COMMIT_TAG}"
                git clone "https://github.com/kareemelkasaby1/jenkins_nodejs_example"
                git  checkout -b k8s_task ${params.COMMIT_TAG}
            }
        }
    }
}