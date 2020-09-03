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
                            sh "sed -i 's/port_value/32000/g' node-service.yml"
                    }

                }
                sh 'su jenkins'
                sh """
                    if ! kubectl get secrets mysql-user --namespace=${params.NAMESPACE} 
                    then
                        kubectl create secret --namespace=${params.NAMESPACE}  generic mysql-user --from-literal=MYSQL_USER=$MYSQL_USERNAME
                    fi
                """
                sh """
                    if ! kubectl get secrets mysql-secret --namespace=${params.NAMESPACE} 
                    then
                        kubectl create secret --namespace=${params.NAMESPACE}  generic mysql-secret --from-literal=mysqlrootpassword=$MYSQL_USER_PASSWORD --from-literal=mysqluserpassword=$MYSQL_ROOT_PASSWORD
                    fi
                """
                sh "kubectl apply -f node-project-deployment.yaml --namespace=${params.NAMESPACE}"
                sh "kubectl apply -f node-service.yml --namespace=${params.NAMESPACE}"
            }
        }
    }
}
