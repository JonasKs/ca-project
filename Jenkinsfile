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
        sh 'docker run --rm -i -p 5000:5050 --name pythoncontainer pythonimage:latest python /tmp/ca-project/tests.py'
    }
    stage('Running'){
        sh 'docker stop pythoncontainer || true'
        sh 'docker rm pythoncontainer || true'
	sh 'docker run -d --rm -p 5000:5050 --name pythoncontainer pythonimage:latest python /tmp/ca-project/run.py'
    }
    stage('Up?'){
	sh 'curl --silent http://128.39.121.23:5000/ | grep "Write your post here"'
    }
}
