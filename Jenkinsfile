node {
    stage('Preparation') {
	checkout scm
    }
    stage('Build'){
        sh 'docker build -t pythonimagew .'
    }
    stage('Testing'){
        sh 'docker run --rm -i -p 5000:5060 --name pythoncontainerw pythonimagew:latest python /tmp/ca-project/tests.py'
    }
    stage('Running'){
        sh 'docker stop pythoncontainerw' || true
        sh 'docker rm pythoncontainerw' || true
	sh 'docker run -d --rm -P --name pythoncontainerw pythonimagew:latest python /tmp/ca-project/run.py'
    }
}

