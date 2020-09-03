/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    parameters {
        choice(name: 'NAMESPACE', choices: ['dev', 'test'])
    }
    stages {
        stage('cloning and checkout') {
            steps {
                sh "kubectl apply -f node-project-deployment.yaml --namespace=${params.NAMESPACE}"
            }
        }
    }
}
