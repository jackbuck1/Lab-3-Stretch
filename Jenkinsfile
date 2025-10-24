pipeline{
    agent any

    stages{
        stage("Cleanup"){
            steps{
                //Removes all containers (storage saving) - single speech marks used on 2nd shell as there is a $
                echo "Cleaning up containers"
                sh 'docker rm $(docker ps -aq) || true'
            }
        }
        stage("Setup"){
            steps{
                //Add networks or volumes
                echo "Configuring networks & volumes"
                sh "docker network create lab_3_stretch_network || true"
                sh "docker volume create lab3_stretch_volume"
                sh "docker run -d -p 80:80 --name nginxvolume --mount type=volume,source=lab3_stretch_volume,target=<path/on/container> <app.py:lastest>"
            }
        }
        stage("App Build"){
            steps{
                // app.py
                echo "Building app"
                sh "docker build -t app.py:latest ."
                }   
            }
        stage("Run Containers"){
            steps{
                //Run the containers that have been built in Docker. Have to run on port 8081 as port 8080 is occupied by Java
                echo "Running containers"
                sh "docker run -d --name <container name> -p 8081:80 app.py:latest"
            }
        }
    }
}