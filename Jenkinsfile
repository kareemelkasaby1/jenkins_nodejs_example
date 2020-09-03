/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    parameters {
        choice(name: 'NAMESPACE', choices: ['dev', 'test'])
    }
    stages {
        stage('cloning and checkout') {
            steps {
                script {
                    /* groovylint-disable-next-line DuplicateStringLiteral, NestedBlockDepth */
                    if (params.NAMESPACE == 'dev') {
                            sh "sed -i 's/port_value/32001/g' node-service.yml"
                        /* groovylint-disable-next-line NestedBlockDepth */
                    } else {
                            sh "sed -i 's/port_value/3200/g' node-service.yml"
                    }

                }
                sh 'su jenkins'
                sh "kubectl apply -f node-project-deployment.yaml --namespace=${params.NAMESPACE}"
                sh "kubectl apply -f node-service.yml --namespace=${params.NAMESPACE}"
            }
        }
    }
}
