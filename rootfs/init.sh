#!/usr/bin/env bash
[ -d /cloudposse/jenkins/jobs.d/ ] && \
  (ls  /cloudposse/jenkins/jobs.d | xargs -I {} mkdir -p /var/jenkins_home/jobs/{})  && \
  (ls  /cloudposse/jenkins/jobs.d | xargs -I {} cp -n /cloudposse/jenkins/jobs.d/{} /var/jenkins_home/jobs/{}/config.xml)

[ -d /cloudposse/jenkins/groovy_jobs.d/ ] && \
  (ls  /cloudposse/jenkins/groovy_jobs.d | xargs -I {} mkdir -p /var/jenkins_home/workspace/default-dsl-job/jobs/{})  && \
  (ls  /cloudposse/jenkins/groovy_jobs.d | xargs -I {} cp -R -n /cloudposse/jenkins/groovy_jobs.d/{} /var/jenkins_home/workspace/default-dsl-job/jobs)
  tree /var/jenkins_home/

exec /usr/local/bin/jenkins.sh
