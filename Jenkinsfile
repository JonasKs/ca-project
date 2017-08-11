node {
    stage('Preparation') {
        //git credentialsId: 'ubuntukey', url: 'git@github.com:JonasKs/gildedrose.git'
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'ubuntukey', url: 'git@github.com:JonasKs/ca-project.git']]])
    }
    stage('Build'){
        sh 'docker build -t pythonimage .'
    }
    stage('Results'){
	echo 'some results'
	sh 'sh 'docker run -i --rm --name pythoncontainer pythonimage:latest'
    }
}

