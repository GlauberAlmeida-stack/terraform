pipeline {
    agent any

    stages {

        stage("Verificar código") {

            steps {
                git url: 'https://github.com/GlauberAlmeida-stack/terraform.git', branch: 'main'
                sh 'ls'
            }
        }

        stage("Execução Pipeline") {
            script {
                sh 'terraform init'
                sh 'terraform plan'
                sh 'terraform apply'
            }
        }    
                
    }

}
