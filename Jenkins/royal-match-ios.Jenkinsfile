pipeline {
  agent {
    node {
        label 'mac'
    } 
  }
  options {
    disableConcurrentBuilds()
  }

  environment {
    REPO_ADDRESS = "git@github.com:dream-games/jenkinsfile_demo.git"
  }

  parameters {
    choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'Select environment')
    string(name: 'BRANCH', defaultValue: 'master', description: 'Write name of the branch.')
    string(name: 'PARENT_BUILD_NUMBER', defaultValue: "\$BUILD_NUMBER", description: 'Define build number.')
  }
  stages {
    stage('Checkout Code') {
      steps {
        checkout([  $class: 'GitSCM', 
            branches: [[name: "${params.BRANCH}"]],
                extensions: [
                    [$class: 'GitLFSPull'],
                    [$class: 'CheckoutOption', timeout: 20], //default: 10 
                    [$class: 'CloneOption', // not in the UI 
                            depth: 0,
                            noTags: false,
                            shallow: false,
                            timeout: 120]
                ],

                userRemoteConfigs: [
                    [credentialsId: 'github-drm',
                    url: "${env.REPO_ADDRESS}"]
                ]
            ])
      }
    }

    stage('Build IOS') {
      steps {
         sh(returnStdout: true, script: "sh External/Release/build_ios.sh")
      }
    }
  }
}
