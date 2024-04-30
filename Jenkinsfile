pipeline {
    agent any
    options {
        timeout(time: 20, unit: 'MINUTES')
    }
    stages{
        // NPM dependencies
        stage('pull npm dependencies') {
            steps {
                sh 'npm install'
            }
        }
       stage('build Docker Image') {
            steps {
                script {
                    // build image
                    docker.build("720826398753.dkr.ecr.us-east-1.amazonaws.com/netflix-app-ecr:v1.0")
               }
            }
        }
        stage('Trivy Scan (Aqua)') {
            steps {
                sh 'trivy image --format template --output trivy_report.html 720826398753.dkr.ecr.us-east-1.amazonaws.com/netflix-app-ecr:v1.0'
            }
       }
        stage('Push to ECR') {
            steps {
                script{
                    //https://<AwsAccountNumber>.dkr.ecr.<region>.amazonaws.com/netflix-app', 'ecr:<region>:<credentialsId>
                    docker.withRegistry('720826398753.dkr.ecr.us-east-1.amazonaws.com/netflix-app-ecr:v1.0', 'ecr:us-east-1:morel-ecr-creds') {
                    // build image
                    def myImage = docker.build("720826398753.dkr.ecr.us-east-1.amazonaws.com/netflix-app-ecr:v1.0")
                    // push image
                    myImage.push()
                    }
                }
            }
        }
        
    }
}
