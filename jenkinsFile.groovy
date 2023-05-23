pipeline {
  agent any
  stages {
    stage('Checkout Scm') {
      steps {
        git 'https://github.com/haule2020/BeaMigrationTest.git'
      }
    }

  }
}