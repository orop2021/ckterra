pipeline {
   agent any
   tools {
      terraform 'terraform'
 }
  stages {
    stage('Terraform Init') {
      steps{
        sh 'terraform init'
    }
   }
    stage('Terraform Validate') {
      steps{
        sh 'terraform validate'
    } 
   }
     stage('Terraform Destroy') {
      steps{
        sh 'terraform destroy --auto-approve'
    }
   }
    stage('Terraform Plan') {
      steps{
        sh 'terraform plan'
    }
   }
    stage('Terraform Apply') {
      steps{
        sh 'terraform apply --auto-approve'
    }
   }
  }
}