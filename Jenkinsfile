//git凭证ID
def git_auth = "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"
//git的url地址
def git_url = "https://github.com/scg130/hello-world.git"

def branch = env.GIT_BRANCH
// 如果是父子工程，12-14行代码可以注释掉
node('jnlp') {
    stage('checkout') {
        sh "echo ${env}"
        checkout([$class: 'GitSCM', branches: [[name: "*/${branch}"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: "${git_auth}", url: "${git_url}"]]])
    }
 
    stage('build') {
        sh "echo  1"
    }
 
    stage('test') {
        //定义项目名称+镜像的版本号,对镜像名称进行拼接
        // def imageName = "${project_name}:${tag}"
        // 编译打包开始
        // sh "mvn clean package -Dmaven.test.skip=true dockerfile:build "
        //对镜像打上标签
        // sh "docker tag ${imageName} ${imageName}"
        sh "echo 2"
    }
 
    stage('docker') {
         //镜像名称
        //  def imageName = "${project_name}:${tag}"
         //删除原有容器
        //  sh "docker rm -f ${project_name}"
         // 创建一个容器映射的目标
        //  sh "mkdir -p /opt/docker/${project_name}"
         //容器加一层挂载目录
        //  sh "docker run -di -v /opt/docker/${project_name}/opt:/opt --name ${project_name}  -p ${host_port}:${container_port}  ${imageName}"
        sh "echo 3"
    }
 
    stage('deploy') {
    //    sh "docker logs -f ${project_name}"
        sh "echo 4"
    }
 
}