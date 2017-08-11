node {
    stage('Preparation') {
	checkout scm
    }
    stage('Build'){
        sh 'docker build -t pythonimage .'
    }
    stage('Spawning'){
        echo "Checking if pythoncontainer already exist"
        sh 'docker rm -f pythoncontainer'
        sh 'docker run -i -p 5000:5050 --name pythoncontainer pythonimage:latest'
    }
    stage('Testing'){
        sh 'docker start pythoncontainer'
        sh 'docker exec pythoncontainer python /tmp/ca-project/tests.py'
    }
    stage('Running'){
        sh 'docker exec pythoncontainer python /tmp/ca-project/run.py'
    }
}

