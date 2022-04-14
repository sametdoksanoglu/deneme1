pipeline {
  agent any

  options {
        disableConcurrentBuilds()
  }

  parameters {
    choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'Select environment.')
    string(name: 'BRANCH', defaultValue: 'master', description: 'Write name of the branch.')
    booleanParam(name: 'Huawei', defaultValue: false, description: 'Select for Huawei App Gallery.')
    booleanParam(name: 'Samsung', defaultValue: false, description: 'Select for Samsung Galaxy Store.')
  }

  stages {
    stage('Build royal-match-marketing') {
      when {
        expression {
          params.BRANCH == "marketing"
        }
      }

      steps {        
         build job: 'royal-match-marketing', parameters: [
          [$class: 'StringParameterValue', name: "PARENT_BUILD_NUMBER", value: "${BUILD_NUMBER}"]
        ], wait: false
      }
    }

    stage('Build IOS and Android Master') {
      when {
        expression {
          params.BRANCH == "master"
        }
      }   
      steps {
        build job: 'royal-match-ios', parameters: [
          [$class: 'StringParameterValue', name: "ENVIRONMENT", value: "${params.ENVIRONMENT}"],
          [$class: 'StringParameterValue', name: "BRANCH", value: "${params.BRANCH}"],
          [$class: 'StringParameterValue', name: "PARENT_BUILD_NUMBER", value: "${BUILD_NUMBER}"]
        ], wait: false
        build job: 'royal-match-android', parameters: [
          [$class: 'StringParameterValue', name: "ENVIRONMENT", value: "${params.ENVIRONMENT}"],
          [$class: 'StringParameterValue', name: "BRANCH", value: "${params.BRANCH}"],
          [$class: 'StringParameterValue', name: "PARENT_BUILD_NUMBER", value: "${BUILD_NUMBER}"]
        ], wait: false
      }
    }

    stage('Build IOS and Android Branch') {
      when {
        expression {
          params.BRANCH != "master" && "${BUILD_NUMBER}" != "marketing"
        }
      }
      steps{
         build job: 'royal-match-ios-branch', parameters: [
          [$class: 'StringParameterValue', name: "PARENT_BUILD_NUMBER", value: "${BUILD_NUMBER}"]
        ], wait: false
        build job: 'royal-match-android-branch', parameters: [
          [$class: 'StringParameterValue', name: "PARENT_BUILD_NUMBER", value: "${BUILD_NUMBER}"]
        ], wait: false
      }
    }

    stage('Build Samsung') {
      when {
        expression {
          params.Samsung
        }
      }
      steps {
         build job: 'royal-match-samsung', parameters: [
          [$class: 'StringParameterValue', name: "PARENT_BUILD_NUMBER", value: "${BUILD_NUMBER}"]
        ], wait: false
      }
    }

    stage('Build Huawei') {
      when {
        expression {
          params.Huawei
        }
      }
      steps {
         build job: 'royal-match-huawei', parameters: [
          [$class: 'StringParameterValue', name: "PARENT_BUILD_NUMBER", value: "${BUILD_NUMBER}"]
        ], wait: false
      }
    }

  }
}
