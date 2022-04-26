pipeline {
    agent { label 'jnlp' }
    stages {
        stage('Build') {
            steps {
                groovy {
                    script 'docker -v'
                }
            }
        }
    }
}