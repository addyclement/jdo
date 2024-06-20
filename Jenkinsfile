pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    environment {
        AWS_DEFAULT_REGION = 'eu-west-1'
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        stage('Upload State to S3') {
            steps {
                script {
                    sh 'aws s3 cp terraform.tfstate s3://jenkins-state-01'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
