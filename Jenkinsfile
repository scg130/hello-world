pipeline {
    agent { label 'linux' }
    stages {
        stage('Build') {
            steps {
                groovy {
                    script 'println "Hello World"'
                }
            }
        }
    }
}