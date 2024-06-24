pipeline {
    agent any

    stages {

        stage("Verificar código") {

            steps {
                git url: 'https://github.com/GlauberAlmeida-stack/terraform.git', branch: 'main'
                sh 'ls'
            }
        }    
    }

}
