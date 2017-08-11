node {
    stage('Preparation') {
	checkout scm
    }
    stage('Build'){
        sh 'docker build -t pythonimageWorkingbranch .'
    }
    stage('Testing'){
        sh 'docker run --rm -i -p 5000:5060 --name pythoncontainerWorkingbranch pythonimageWorkingbranch:latest python /tmp/ca-project/tests.py'
    }
    stage('Running'){
        sh 'docker stop pythoncontainerWorkingbranch' || true
        sh 'docker rm pythoncontainerWorkingbranch' || true
	sh 'docker run -d --rm -P --name pythoncontainerWorkingbranch pythonimageWorkingbranch:latest python /tmp/ca-project/run.py'
    }
}

