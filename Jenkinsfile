/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    parameters {
        choice(name: 'NAMESPACE', choices: ['dev', 'test'])
    }
    stages {
        stage('cloning and checkout') {
            steps {
                sh 'su jenkins'
                sh "kubectl apply -f node-project-deployment.yaml --namespace=${params.NAMESPACE}"
                sh "kubectl apply -f node-service.yml --namespace=${params.NAMESPACE}"
            }
        }
    }
}
