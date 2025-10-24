pipeline{
    agent any
    stages{
        stage("Making a directory"){
            steps{
                sh "mkdir ~/jenkins-test || true"       
        }
        }
        stage("Adding a file"){
            steps{
                sh "touch ~/jenkins-test/file.txt"
            }
        }
    }
}