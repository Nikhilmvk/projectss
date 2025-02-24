pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

    stages {  // ✅ Add missing 'stages' block
        stage('Terraform Init') {
            steps {
                powershell 'C:\\Users\\USER\\Downloads\\terraform_1.10.5_windows_amd64\\terraform init'
            }
        }

        stage('Plan') {
            steps {
                powershell 'C:\\Users\\USER\\Downloads\\terraform_1.10.5_windows_amd64\\terraform plan'
            }
        }

        stage('Apply') {
            steps {
                powershell 'C:\\Users\\USER\\Downloads\\terraform_1.10.5_windows_amd64\\terraform apply -auto-approve'
            }
        }
    }  
}
