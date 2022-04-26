pipeline {
    stage("deploy to test") {
    when {
        branch 'master'
    }
    steps{
        echo "deploy to prod"
    }
}

stage("deploy to prod") {
    when {
        branch 'develop'
    }
    steps {
        echo "deploy to test"
    }
}
}