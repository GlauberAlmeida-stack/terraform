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

            environment{
                AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
                AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
                AWS_DEFAULT_REGION = credentials('AWS_DEFAULT_REGION')
                AWS_BUCKET = credentials('AWS_BUCKET')
                AWS_BUCKET_KEY = credentials('AWS_BUCKET_KEY')

            }

            steps{
                script {
                    sh 'terraform init backend-config="bucket=$AWS_BUCKET" backend-config="key=$AWS_BUCKET_KEY" '
                    sh 'terraform plan'
                    sh 'terraform apply'
                }
            }    
        }    
                
    }

}
