pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'MAVEN21'
    }
     environment {
        SCANNER_HOME = tool 'sonar8'
        registryCredential = 'ecr:us-east-1:awstoken'
    vprofileRegistry = 'https://210806258649.dkr.ecr.us-east-1.amazonaws.com'
    imageName = '210806258649.dkr.ecr.us-east-1.amazonaws.com/vprofile'
    cluster = "vproappcluster"
        service = "vproappservice-service-ydzob4sf"
    }
 

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'docker',
                    url: 'https://github.com/hkhcoder/vprofile-project'
            }
        }

        stage('Verify Tools') {
            steps {
                sh '''
                    echo "Java Version"
                    java -version

                    echo "Maven Version"
                    mvn -version
                '''
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Checkstyle Analysis') {
            steps {
                sh 'mvn checkstyle:checkstyle'
            }
        }

        stage('Package Application') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }
        stage('Upload Artifact to Nexus') {
    steps {
        nexusArtifactUploader(
            nexusVersion: 'nexus3',
            protocol: 'http',
            nexusUrl: '172.31.95.104:8081',
            groupId: 'QA',
            version: "${env.BUILD_ID}",
            repository: 'vprofiledocker',
            credentialsId: 'Nexus',
            artifacts: [
                [
                    artifactId: 'vprofile',
                    classifier: '',
                    file: 'target/vprofile-v2.war',
                    type: 'war'
                ]
            ]
        )
    }
}
stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarscanner') {
                    sh """
                        ${SCANNER_HOME}/bin/sonar-scanner \
                        -Dsonar.projectKey=vprofile \
                        -Dsonar.projectName=vprofile \
                        -Dsonar.sources=src \
                        -Dsonar.java.binaries=target/classes
                    """
                }
            }
        }
        stage('Build App Image') {
    steps {
        script {
            dockerImage = docker.build( imageName + ":${BUILD_NUMBER}",
                "./Docker-files/app/multistage/"
            )
        }
    }
}

stage('Upload App Image') {
    steps {
        script {
            docker.withRegistry(
                vprofileRegistry,
                registryCredential
            ) {

                dockerImage.push("${BUILD_NUMBER}")
                dockerImage.push("latest")

            }
        }
    }
}
stage('Deploy to ECS') {
    steps {
        withAWS(credentials: 'awstoken', region: 'us-east-1') {
            sh "aws ecs update-service --cluster ${cluster} --service ${service} --force-new-deployment"
        }
    }
}
       }

    post {
        success {
            echo 'Build completed successfully.'
        }

        failure {
            echo 'Build failed. Please check the Jenkins Console Output.'
        }

        always {
            cleanWs()
        }
    }
}