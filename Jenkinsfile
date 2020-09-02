pipeline {
    agent any
    parameters {
        string(name: 'COMMIT_TAG', defaultValue: 'a197e3d7c66c041541fcaa1302803da7b4daf028')
    }
    stages {
        stage('Example') {
            steps {
                echo "Hello ${params.COMMIT_TAG}"
                git clone https://github.com/kareemelkasaby1/jenkins_nodejs_example
                git  checkout -b k8s_task ${params.COMMIT_TAG}
            }
        }
    }
}