# **Terraform CI/CD with Jenkins**

## **Project Overview**
This project automates infrastructure deployment using Terraform and Jenkins, eliminating manual `terraform plan` and `terraform apply` steps.  

## **Prerequisites**
Before running this project, ensure you have the following installed and configured:
- **Terraform** (`>= 1.10.5`)
- **Jenkins** (with required plugins)
- **AWS CLI** (configured with access and secret keys)
- **Git** (for version control)
- **Ansible** (if provisioning instances)

---

## **1. Setup Infrastructure with Terraform**

### **Step 1: Clone the Repository**  
```sh
git clone <repository-url>
cd terraform
```

### **Step 2: Configure AWS Credentials**  
Set up AWS credentials in `~/.aws/credentials` (Linux/Mac) or `%USERPROFILE%\.aws\credentials` (Windows):  
```
[default]
aws_access_key_id = YOUR_ACCESS_KEY
aws_secret_access_key = YOUR_SECRET_KEY
region = YOUR_REGION
```

### **Step 3: Initialize Terraform**  
```sh
terraform init
```

### **Step 4: Validate Terraform Configuration**  
```sh
terraform validate
```

### **Step 5: Plan the Deployment**  
```sh
terraform plan
```

### **Step 6: Apply Terraform Configuration**  
```sh
terraform apply -auto-approve
```
This step provisions AWS resources (EC2, security groups, etc.).

---

## **2. Automating with Jenkins**

### **Step 1: Install Required Plugins**
Ensure Jenkins has the following plugins installed:
- **Pipeline Plugin**
- **Terraform Plugin**
- **Git Plugin**
- **AWS Credentials Plugin**

### **Step 2: Create a New Jenkins Pipeline Job**
1. Open Jenkins → New Item → Pipeline.
2. Add a description and configure the pipeline as follows.

### **Step 3: Configure Jenkins Pipeline**

#### **Option 1: Using Jenkinsfile (Recommended)**
Add a `Jenkinsfile` to your repository:
```groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Clone Repository') {
            steps {
                git '<repository-url>'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
```

#### **Option 2: Manual Configuration**
1. Select **Pipeline Script** in Jenkins.
2. Copy and paste the above script.

### **Step 4: Run the Pipeline**
1. Click **Build Now** to trigger the pipeline.
2. Monitor the logs for success/failure messages.

---

## **3. Destroy Infrastructure (Optional)**
If you want to destroy the infrastructure:
```sh
terraform destroy -auto-approve
```

---

## **4. Troubleshooting**

### **Common Issues & Fixes**
| **Issue** | **Fix** |
|-----------|--------|
| `InvalidAMIID.NotFound` | Ensure the AMI ID is correct for your AWS region. |
| `Access Denied` | Verify AWS IAM permissions for Terraform. |
| `Jenkins build fails` | Check Jenkins logs and AWS credentials setup. |

---

## **Conclusion**
This project integrates Terraform with Jenkins for automated infrastructure provisioning. You can extend it further with Ansible, monitoring (Prometheus, Grafana), or integrate it into a full DevOps pipeline.

