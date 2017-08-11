node {
    stage('Preparation') {
        //git credentialsId: 'ubuntukey', url: 'git@github.com:JonasKs/gildedrose.git'
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'ubuntukey', url: 'git@github.com:JonasKs/ca-project.git']]])
    }
    stage('Build'){
        sh 'docker build -t pythonimage .'
    }
    stage('Spawning'){
	echo "Checking if pythoncontainer already exist"
	sh 'docker rm -f pythoncontainer'
	sh 'docker run -i --name pythoncontainer pythonimage:latest'
    }
    stage('Testing'){
	sh 'docker exec pythoncontainer python /tmp/ca-project/tests.py'
    }
    stage('Running'){
	sh 'docker exec pythoncontainer python /tmp/ca-project/run.py'
    }
    stage('Cleanup'){
	sh 'docker rm -f pythoncontainer'
    }
}
