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
                sh "sed -i 's/NAMESPACE_USERCHOOSE/${params.NAMESPACE}/g' *.yml"
                sh """
                    if ! kubectl get secrets mysql-user --namespace=${params.NAMESPACE} 
                    then
                        sed -i 's/MYSQL_USERNAME/$MYSQL_USERNAME/g' create-username-secret.yml
                        ansible-playbook create-username-secret.yml
                    fi
                """
                sh """
                    if ! kubectl get secrets mysql-secret --namespace=${params.NAMESPACE} 
                    then
                        sed -i 's/MYSQL_USER_PASSWORD/$MYSQL_USER_PASSWORD/g' create-passwords-secret.yml
                        sed -i 's/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g' create-passwords-secret.yml
                        ansible-playbook create-passwords-secret.yml
                    fi
                """
                sh "kubectl apply -f node-project-deployment.yaml --namespace=${params.NAMESPACE}"
                sh "kubectl apply -f node-service.yml --namespace=${params.NAMESPACE}"
            }
        }
    }
}
