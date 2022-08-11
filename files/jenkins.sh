JENKINS_SECRET_NAME=
JENKINS_MASTER=
JENKINS_WORK_DIR=
JENKINS_NODE_NAME=
JENKINS_SECRET=$(aws secretsmanager get-secret-value --secret-id $JENKINS_SECRET_NAME --query SecretString --output text)
JENKINS_NODE_STRING="${JENKINS_NODE_NAME//-/$'%2D'}"
java -jar $JENKINS_WORK_DIR/agent.jar -jnlpUrl http://$JENKINS_MASTER:8080/computer/$JENKINS_NODE_STRING/jenkins-agent.jnlp -secret $JENKINS_SECRET -workDir  "$JENKINS_WORK_DIR/"
exit 0

