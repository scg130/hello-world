
def git_auth = "github-auth"

def git_url = "https://github.com/scg130/hello-world.git"

def project_name = ""
def branch = env.BRANCH_NAME
tag  = branch.replaceAll("/", "-")
node('jnlp') {
        stage("ready"){
            sh 'echo "ready"'
        }
    stage('clone') {
        //  sh "env" 
        sh "echo ${branch}"
        sh 'echo clone'
        checkout([$class: 'GitSCM', branches: [[name: "*/${branch}"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: "${git_auth}", url: "${git_url}"]]])
        project_name = sh (script: 'basename -s .git `git config --get remote.origin.url`', returnStdout:true).trim()
        sh 'go mod tidy'
        sh 'ls -al'
    }

    stage('test') {
        echo 'go test'
        echo "${branch}"
        //sh 'make test'
    }

    stage('build') {
        script{
            echo 'go build'
            sh 'make build'
        }
    }

    stage('docker') {
        sh 'echo docker'
        script{
            sh "make docker tag=${tag}"
            withCredentials([usernamePassword(credentialsId: 'hub-docker', passwordVariable: 'passwd', usernameVariable: 'user')]) {
                //  sh "make push user=$user pwd=$passwd tag=$tag"
            }
        }
    }

    stage('deploy') {
        echo "deploy"
        script{
            def ver = sh (script: 'date +%s', returnStdout:true).toString().trim()
            sh "sed -i 's/<TAG>/${tag}/g' k8s.yml"
            sh "sed -i 's/<PROJECT>/${project_name}/g' k8s.yml"
            sh "sed -i 's/<VER>/${ver}/g' k8s.yml"
            sh "cat k8s.yml"
            sh "kubectl apply -f k8s.yml"
        }
    }

    stage('delete image') {
        echo "delete images"
        sh "docker system prune -f"
    }
}
