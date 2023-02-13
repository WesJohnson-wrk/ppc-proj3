
pipeline {
    agent {
      node {
        label "main"
      } 
    }     stages {
      stage('fetch_latest_code') {
        steps {
          git credentialsId: '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', url: 'https://github.com/WesJohnson-wrk/ppc-proj3'
        }
      }       stage('TF Init&Plan') {
        steps {
          sh 'terraform init'
          sh 'terraform plan'
        }
      }       stage('Approval') {
        steps {
          script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
          }
        }
      }       stage('TF Apply') {
        steps {
          sh 'terraform apply -input=false'
        }
      }
    } 
  }
