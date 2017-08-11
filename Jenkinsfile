node {
    stage('Preparation') {
	checkout scm
    }
    stage('Build'){
        sh 'docker build -t pythonimage .'
    }
    stage('Spawning'){
        sh 'docker run -i -p 5000:5050 --name pythoncontainerWorkingbranch pythonimage:latest'
    }
    stage('Testing'){
        sh 'docker start pythoncontainer'
        sh 'docker exec pythoncontainerWorkingbranch python /tmp/ca-project/tests.py'
    }
    stage('Running'){
        sh 'docker exec pythoncontainerWorkingbranch python /tmp/ca-project/run.py'
    }
}

