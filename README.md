# jenkins-ssh-slave
Jenkins ssh slave with docker support to launch builds inside its own docker.

Based on [`jenkins/ssh-slave`](https://hub.docker.com/r/jenkins/ssh-slave/).

Same usage instruction as the original `jenkins/ssh-slave` with a new
environment variable `DOCKER_GROUP_ON_HOST` and new docker.sock volume mount.

Sample run:

```
docker run
  -e "JENKINS_SLAVE_SSH_PUBKEY=`cat your_id_rsa.pub`" \
  -e "DOCKER_GROUP_ON_HOST=`getent group |grep docker | awk -F: '{print $3}'`" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  pavics/jenkins-ssh-slave
```
