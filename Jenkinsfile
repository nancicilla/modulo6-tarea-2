pipeline{
    agent none
     parameters{
         string defaultValue: 'ambiente_desarrollo', description: 'Nombre del Nodo  del ambiente DESARROLLO   ', name: 'DESARROLLO', trim: false
         string defaultValue: 'vallejos1', description: 'Nombre del Nodo  del ambiente QA   ', name: 'QA', trim: false
         string defaultValue: 'container', description: 'Nombre del Nodo  del ambiente PRODUCCION  ', name: 'PRODUCCION', trim: false

     }
    environment{
        DESARROLLO="${params.DESARROLLO}"
        QA="${params.QA}"
        PRODUCCION="${params.PRODUCCION}"
       
    }
    stages{
        stage("Clonar repositorio"){
            agent { label DESARROLLO }
            steps{
                git branch: 'main', url: 'https://github.com/nancicilla/modulo6-tarea-2.git'
                sh "echo  'Se clono correctamente...'"
            }
        }
        stage("Prepara imagen Docker "){
            agent { label DESARROLLO }
            steps{
                sh "tar -cvf Final.tar database/ public/ src/ babel.config.js  jsconfig.json package.json package-lock.json vue.config.js"
                sh "docker build -t nancy/final:v1 ."
                sh "docker save -o app-final.tar nancy/final:v1"
                stash name: "stash-artifact", includes: "app-final.tar"
                archiveArtifacts 'app-final.tar'
                sh "echo 'imagen preparada correctamente...'"
            }
        }
        stage("Despliegue en ambiente QA"){
            agent { label QA }
            steps{
                unstash "stash-artifact"
                sh "docker load -i app-final.tar"
                sh "docker rm finalv1 -f || true"
                sh "docker run -idt -p 8085:8085 --name finalv1 nancy/final:v1"
                sh "echo 'paso la etapa QA...'"
            }
        }
        stage("Test"){
            agent { label QA}
            steps {
                
                sh "curl http://localhost:8080"
                sh "echo 'paso la prueba de test...'"
                
            }
            
        }
         
        stage("Despliegue en ambiente de Produccion"){
            agent { label PRODUCCION}
            steps {
                //sh "produccion.yml"
                sh "echo 'OK..'"
            }
            
        }
    }
}
