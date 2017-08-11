node {
    stage('Preparation') {
	checkout scm
    }
    stage('Build'){
        sh 'docker build -t pythonimage .'
    }
    stage('Spawning'){
        sh 'docker run -i -p 5000:5060 --name pythoncontainer pythonimage:latest'
    }
    stage('Testing'){
        sh 'docker start pythoncontainer'
        sh 'docker exec pythoncontainer python /tmp/ca-project/tests.py'
    }
    stage('Running'){
        sh 'docker exec pythoncontainer python /tmp/ca-project/run.py'
    }
}

