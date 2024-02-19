pipeline {
    agent any

    options {
        timeout(time: 2, unit: 'MINUTES')
    }

    environment {
        ARTIFACT_ID = "elbuo8/webapp:${env.BUILD_NUMBER}"
    }

    stages {
        stage('Docker Login') {
            steps {
                script {
                    // Credenciales de Docker Hub almacenadas en Jenkins
                    withCredentials([usernamePassword(credentialsId: 'docker_hub_cred', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        def registryCredentials = "-u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker login $registryCredentials"
                    }
                }
            }
        }

        stage('Building image') {
            steps {
                sh '''
                    pwd
                    ls -ltr
                    docker build -t testapp .
                '''
            }
        }

        stage('Run tests') {
            steps {
                sh "docker run testapp npm test"
            }
        }

        stage('Deploy Image') {
            steps {
                sh '''
                    docker tag testapp mromanolazaro/educacionmundoe-pin1:testapp
                    docker push mromanolazaro/educacionmundoe-pin1:testapp
                '''
            }
        }
    }
}
