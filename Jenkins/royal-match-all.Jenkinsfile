pipeline {
  agent any

  options {
    disableConcurrentBuilds()
  }

  parameters {
    choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'Select environment.')
    string(name: 'BRANCH', defaultValue: 'master', description: 'Write name of the branch.')
  }

  stages {

    stage('Trigger IOS  Job') {
      steps {
        build job: 'royal-kingdom-ios', parameters: [
          [$class: 'StringParameterValue', name: "ENVIRONMENT", value: "${params.ENVIRONMENT}"],
          [$class: 'StringParameterValue', name: "BRANCH", value: "${params.BRANCH}"],
          [$class: 'StringParameterValue', name: "PARENT_BUILD_NUMBER", value: "${BUILD_NUMBER}"]
        ], wait: false
      }
    }

    stage('Trigger Android Job') { 
      steps {
        build job: 'royal-kingdom-android', parameters: [
          [$class: 'StringParameterValue', name: "ENVIRONMENT", value: "${params.ENVIRONMENT}"],
          [$class: 'StringParameterValue', name: "BRANCH", value: "${params.BRANCH}"],
          [$class: 'StringParameterValue', name: "PARENT_BUILD_NUMBER", value: "${BUILD_NUMBER}"]
        ], wait: false
      }
    }
  
  }
}



