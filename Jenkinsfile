pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

   stage('Terraform Init') {
    steps {
        powershell 'C:\\Users\\USER\\Downloads\\terraform_1.10.5_windows_amd64\\terraform init'
    }
}


        stage('Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }  // ✅ 'stages' block closes correctly
}  // ✅ 'pipeline' block closes correctly
