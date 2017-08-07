pipeline {
  // Note that you can define a default label for docker and dockerfile in either your Jenkins
  // global configuration, or in the configuration for a folder, like a GitHub Organization Folder.
  // If that's defined, that label will be used when you don't specify one here explicitly.
  agent {
    docker "ubuntu:16.04"
  }
  
  stages {
    stage("first stage") {
     
      // Runs at the end of the stage, depending on whether the conditions are met.
      post {
        // always means, well, always run.
        always {
          echo "Start edjanger tests..."
        }
        // changed means when the build status is different than the previous build's status.
        changed {
          echo "Code has changed..."
        }
        // success, failure, unstable all run if the current build status is successful, failed, or unstable, respectively
        success {
          echo "Succeeded tests"
          archive "**/*"
        }
      }
      
      // steps is required and is where you put your stage's actual work
      steps {
        echo "I'm doing things, I guess."
        retry(5) {
          echo "Keep trying this if it fails up to 5 times"
        }
        
        // the script block allows you to run any arbitrary Pipeline script, even if it doesn't fit the Declarative subset.
        script {
          if ("sky" == "blue") {
            echo "You can't actually do loops or if statements etc in Declarative unless you're in a script block!"
          }
        }
      }
    }
 
 }
}
  
