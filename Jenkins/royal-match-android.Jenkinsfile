pipeline {
  agent {
    node {
        label 'MacPro'
    } 
  }
  options {
        disableConcurrentBuilds()
        ansiColor('xterm')
  }

  environment {
    REPO_ADDRESS = "git@github.com:sametdoksanoglu/deneme1.git"
  }

  parameters {
    choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'Select environment')
    string(name: 'BRANCH', defaultValue: 'master', description: 'Write name of the branch.')
    string(name: 'PARENT_BUILD_NUMBER', defaultValue: "\$BUILD_NUMBER" , description: 'Define build number.')
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

    stage('Build Android') {
      steps {
        sh 'echo " last successfull: ${GIT_PREVIOUS_SUCCESSFUL_COMMIT}"'

        sh('External/Release/build_android.sh')
      }
    }

    }
    
    post {
      success {
        script {
            if (params.ENVIRONMENT == 'prod')
              sh 'echo success'
            // androidApkUpload googleCredentialsId: 'Royal Match',
            //     filesPattern: "**/Build/royal-match-${params.PARENT_BUILD_NUMBER}.aab"
            //     trackName: 'internal',
            //     rolloutPercentage: '100' 
        }
      }
    }
}
