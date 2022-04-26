//git凭证ID
def git_auth = "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"
//git的url地址
def git_url = "https://github.com/scg130/hello-world.git"

def branch = env.GIT_BRANCH
// 如果是父子工程，12-14行代码可以注释掉
node('jnlp') {
    stage('clone') {
        sh "echo ${env}"
        checkout([$class: 'GitSCM', branches: [[name: "*/${branch}"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: "${git_auth}", url: "${git_url}"]]])
        sh 'go mod tidy'
        sh 'ls -al'
    }
 
    stage('test') {
        echo 'go test'
        echo "${branch}"
        sh 'make test'
    }
 
    stage('build') {
        sh 'echo build'
        sh 'make build'
    }
 
    stage('docker') {
        sh 'echo docker'
        script{
            sh "make docker tag=${branch}"
            withCredentials([usernamePassword(credentialsId: 'hub-docker', passwordVariable: 'passwd', usernameVariable: 'user')]) {
                // sh "make push user=$user pwd=$passwd tag=$tag"
            }
        }
    }
 
    stage('deploy') {
        echo "deploy"
        script{
            sh "sed -i 's/<BUILD_TAG>/${branch}/' k8s.yml"
            sh "kubectl apply -f k8s.yml"    
        }
    }
    
    stage('delete image') {
        echo "delete images"
        sh "docker system prune -f"
    }
}