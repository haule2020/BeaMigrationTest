pipeline {
  agent any
  stages {
    stage('Checkout Scm') {
      steps {
        git 'https://github.com/haule2020/BeaMigrationTest.git'
      }
    }
    stage('Test Execution') {
      steps {
        
            script {
                sh ("mvn test -DskipFailures=false -Dkarate.options='--tags @apiTest'")
            }
           
      }
    }

    stage('Test Execution') {
      steps {
        
            script {
                publishHTML (target: [
                    allowMissing: false, 
                    alswaysLinkToLastBuild: true, 
                    keepAll: true,  
                    reportDir: 'target/cucumber-html-report/',
                    reportFiles: 'overview-features.html',
                    reportName: 'KarateDemo Report'])
            }           
      }
    }

  }
}