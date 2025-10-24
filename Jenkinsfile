pipeline{
    agent any

    stages{
        stage("Cleanup"){
            steps{
                //Removes all containers (storage saving) - single speech marks used on 2nd shell as there is a $
                //Change shell command to only remove relevant containers e.g prune command 
                echo "Cleaning up containers"
                sh 'docker rm -f $(docker ps -aq) || true'
            }
        }
        stage("Setup"){
            steps{
                //Add networks or volumes
                echo "Configuring networks & volumes"
                sh "docker network create lab_3_stretch_network || true"
                sh "docker volume create lab3_stretch_volume"
            }
        }
        stage("Security Scan"){
            steps{
                //Use Trivy to scan for vulnerabilities within each build
                echo "Running security scan"
                sh "trivy fs /var/lib/jenkins"
                    }
                }
        stage("App Build"){
            steps{
                // app.py
                echo "Building app"
                sh "docker build -t app.py:latest ."
                sh "docker build -t mynginx -f Dockerfile.nginx ."
                }   
            }
        stage("Run Containers"){
            steps{
                //Run the containers that have been built in Docker. Have to run on port 8081 as port 8080 is occupied by Java / -v = --mount
                echo "Running containers"
                sh "docker run -d --network lab_3_stretch_network --name flask-app app.py:latest"
                sh "docker run -d -p 8081:80 --network lab_3_stretch_network --name nginxvolume mynginx:latest"
            }
        }
    }
}