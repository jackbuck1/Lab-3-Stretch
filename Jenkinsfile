pipeline{
    agent any

    stages{
        stage("Cleanup"){
            steps{
                //Remove containers (storage saving)
                echo "Cleaning up containers"
                sh "docker rm $(docker ps -aq) || true"
            }
        }
        stage("Setup"){
            steps{
                //Add networks or volumes
                echo "Configuring networks"
                sh "docker volume create lab3_stretch_volume"
                sh "docker run -d -p 80:80 --name nginxvolume --mount type=volume,source=lab3_stretch_volume,target=<path/on/container> <name of image>"
            }
        }
        stage("App Build"){
            steps{
                // app.py
                echo "Building ${app.py}"
                }   
            }
        stage("Run Containers"){
            steps{
                //Run the containers that have been built in Docker
                echo "Running containers"
                sh "..."
            }
        }
    }
}