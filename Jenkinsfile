#!groovy
node {
    def git
    def commitHash
    def buildImage

    stage('Checkout') {
        git = checkout scm
        commitHash = git.GIT_COMMIT
    }

    stage('Build') {
        sh './gradlew build -x test'
    }

    stage('Build Docker Image') {
        buildImage = docker.build("hubtea/oauth-service:${commitHash}")
    }


    stage('Archive') {
        parallel (
            "Archive Artifacts" : {
                archiveArtifacts artifacts: '**/build/libs/*.jar', fingerprint: true
            },
            "Docker Image Push" : {
                buildImage.push("${commitHash}")
                buildImage.push("latest")
            }
        )
    }

    stage('Kubernetes Deploy') {
        sh 'kubectl apply --namespace=development -f deployment.yaml'
    }
}