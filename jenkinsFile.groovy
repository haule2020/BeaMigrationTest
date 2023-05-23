pipeline {
  agent any

  tools {
        maven 'Maven 3.9.2'
    }
  stages {
    // stage('Checkout Scm') {
    //   steps {
    //     git 'https://github.com/haule2020/BeaMigrationTest.git'
    //   }
    // }
    stage('Test Execution') {
      steps {
        
            script {
                sh ("mvn test -DskipFailures=false -Dkarate.options='--tags @apiTest'")
            }
           
      }
    }

    stage('Upload report') {
      steps {
        
            script {
                publishHTML (target: [
                    allowMissing: false, 
                    keepAll: true,  
                    reportDir: 'target/cucumber-html-reports/',
                    reportFiles: 'overview-features.html',
                    reportName: 'KarateDemo Report'])
            }           
      }
    }

  }
}