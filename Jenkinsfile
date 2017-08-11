node {
    stage('Preparation') {
	checkout scm
    }
    stage('Build'){
        sh 'docker build -t pythonimage .'
    }
    stage('Testing'){
        sh 'docker stop pythoncontainer || true'
        sh 'docker rm pythoncontainer || true'
        sh 'docker run --rm -i -p 5060:5000 --name pythoncontainer pythonimage:latest python /tmp/ca-project/tests.py'
    }
    stage('Running'){
        sh 'docker stop pythoncontainer || true'
        sh 'docker rm pythoncontainer || true'
	sh 'docker run -d --rm -p 5050:5000 --name pythoncontainer pythonimage:latest python /tmp/ca-project/run.py'
    }
}

