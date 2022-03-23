pipeline {
    agent {
      node { 
        label 'flutter-android'
	    }
    }
    
    options {
      buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
      disableConcurrentBuilds()
      skipDefaultCheckout()  
    }

    stages {
       stage('CheckOut') {
        steps {
          checkout scm
        }
      }

      stage('Build APK Dev') {
	      when { 
          anyOf { 
            branch 'development'; 
          } 
        }       
        steps {
          withCredentials([
            file(credentialsId: 'serap-app-google-service-dev', variable: 'GOOGLEJSONDEV'),
            file(credentialsId: 'serap-app-config-dev', variable: 'APPCONFIGDEV'),
          ]) {
            sh 'mkdir config && cp $APPCONFIGDEV config/app_config.json'
            sh 'cp $GOOGLEJSONDEV android/app/google-services.json'
            sh 'rm pubspec.lock && flutter channel stable && flutter upgrade && flutter clean && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && flutter build apk --release'
            stash includes: 'build/app/outputs/apk/release/**/*.apk', name: 'appbuild'
          }
        }
      }

      stage('Build APK Hom') {
	      when { 
          anyOf { 
            branch 'release' 
          } 
        }       
        steps {
          withCredentials([
            file(credentialsId: 'serap-app-google-service-hom', variable: 'GOOGLEJSONHOM'),
            file(credentialsId: 'serap-app-config-hom', variable: 'APPCONFIGHOM'),
          ]) {
            sh 'mkdir config && cp $APPCONFIGHOM config/app_config.json'
            sh 'cp $GOOGLEJSONHOM android/app/google-services.json'
            sh 'rm pubspec.lock && flutter channel stable && flutter upgrade && flutter clean && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && flutter build apk --release'
          }
        }
      }
	    
      stage('Build APK Prod') {
        when {
          branch 'master'
        }
        steps {
          withCredentials([
            file(credentialsId: 'serap-app-google-service-prod', variable: 'GOOGLEJSONPROD'),
            file(credentialsId: 'serap-app-config-prod', variable: 'APPCONFIGPROD'),
            file(credentialsId: 'app-key-jks', variable: 'APPKEYJKS'),
            file(credentialsId: 'app-key-properties', variable: 'APPKEYPROPERTIES'),
          ]) {
            sh 'cp ${APPKEYJKS} ~/key.jks && cp ${APPKEYPROPERTIES} ${WORKSPACE}/android/key.properties'
            sh 'cat ${WORKSPACE}/android/key.properties | grep keyPassword | cut -d\'=\' -f2 > /home/cirrus/key.pass'
            sh 'cd ${WORKSPACE} && mkdir config && cp $APPCONFIGPROD config/app_config.json'
	          sh 'cp ${GOOGLEJSONPROD} android/app/google-services.json'
            sh 'rm pubspec.lock && flutter channel stable && flutter upgrade && flutter clean && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && flutter build apk --release'
            sh "cd ~/ && ./android-sdk-linux/build-tools/29.0.2/apksigner sign --ks ~/key.jks --ks-pass file:/home/cirrus/key.pass ${WORKSPACE}/build/app/outputs/apk/release/app-release.apk"
	        }
        }
      }

      stage('Release Github') {
        agent { label 'master' }
        when { anyOf {  branch 'release';  branch 'development'; branch 'master';} }
        steps{
          script{
            try {
                withCredentials([string(credentialsId: "github_token_serap_app", variable: 'token')]) {
                    dir('/tmp'){
                        unstash 'appConfig'
                    }
                    sh 'echo $token > /tmp/teste'
                }
            } 
            catch (err) {
                echo err.getMessage()
            }
          }
        }		
      }  

  }

  post {
    always {
      echo 'One way or another, I have finished'
      archiveArtifacts artifacts: 'build/app/outputs/apk/release/**/*.apk', fingerprint: true
    }
    success {
      telegramSend("${JOB_NAME}...O Build ${BUILD_DISPLAY_NAME} - Esta ok !!!\n Consulte o log para detalhes -> [Job logs](${env.BUILD_URL}console)\n\n Uma nova versão da aplicação esta disponivel!!!")
    }
    unstable {
      telegramSend("O Build ${BUILD_DISPLAY_NAME} <${env.BUILD_URL}> - Esta instavel ...\nConsulte o log para detalhes -> [Job logs](${env.BUILD_URL}console)")
    }
    failure {
      telegramSend("${JOB_NAME}...O Build ${BUILD_DISPLAY_NAME}  - Quebrou. \nConsulte o log para detalhes -> [Job logs](${env.BUILD_URL}console)")
    }
    changed {
      echo 'Things were different before...'
    }
    aborted {
      telegramSend("O Build ${BUILD_DISPLAY_NAME} - Foi abortado.\nConsulte o log para detalhes -> [Job logs](${env.BUILD_URL}console)")
    }
  }
}
