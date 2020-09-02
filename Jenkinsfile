pipeline {
    agent any
    parameters {
        string(name: 'COMMIT_TAG', defaultValue: 'a197e3d7c66c041541fcaa1302803da7b4daf028')
    }
    stages {
        stage('Example') {
            steps {
                echo "Hello ${params.COMMIT_TAG}"
            }
        }
    }
}