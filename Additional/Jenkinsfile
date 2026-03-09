-----------------------------------------------------------
SECTION 1: COMPLETE JENKINS PIPELINE (ALL COMPONENTS)
-----------------------------------------------------------

Jenkinsfile (Declarative Pipeline – Best Practices)

pipeline {

    agent any

    environment {
        APP_NAME   = "enterprise-app"
        BUILD_ENV  = "dev"
        DEPLOY_DIR = "/opt/enterprise-app"
    }

    options {
        timeout(time: 30, unit: 'MINUTES')
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    triggers {
        pollSCM('H/5 * * * *')
        // githubPush() for webhook-based triggering
    }

    parameters {
        string(name: 'ENV', defaultValue: 'dev', description: 'Target environment')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Execute unit tests')
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/org/enterprise-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Compiling application source code"'
            }
        }

        stage('Test') {
            when {
                expression { params.RUN_TESTS == true }
            }
            steps {
                sh 'echo "Executing unit and integration tests"'
            }
        }

        stage('Static Code Analysis') {
            steps {
                sh 'echo "Running quality and security scans"'
            }
        }

        stage('Package') {
            steps {
                sh '''
                mkdir -p build
                echo "application artifact" > build/app.jar
                '''
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'build/**', fingerprint: true
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                mkdir -p $DEPLOY_DIR
                cp -r build/* $DEPLOY_DIR
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully"
        }
        failure {
            echo "Pipeline execution failed"
        }
        always {
            cleanWs()
        }
    }
}

-----------------------------------------------------------
SECTION 2: JENKINS FUNDAMENTALS – INTERVIEW Q&A
-----------------------------------------------------------

Q1. What is Jenkins?
Jenkins is an open-source automation server used to implement Continuous Integration and Continuous Delivery by automating build, test, and deployment workflows.

Q2. Why Jenkins is widely used?
Because it is extensible via plugins, supports pipeline-as-code, integrates with almost every DevOps tool, and allows full control over CI/CD infrastructure.

Q3. What is a Jenkins pipeline?
A Jenkins pipeline is a defined sequence of automated steps written as code to deliver software through build, test, and deployment stages.

Q4. What is Jenkinsfile?
A Jenkinsfile is a text file stored in source control that defines the pipeline logic, enabling versioned and repeatable CI/CD processes.

Q5. Declarative vs Scripted pipeline?
Declarative pipeline provides a structured, opinionated syntax suitable for standard CI/CD. Scripted pipeline offers full Groovy flexibility and is used for complex logic.

Q6. What is an agent in Jenkins?
An agent is a node where Jenkins executes pipeline steps. It enables distributed builds and workload isolation.

Q7. What are stages and steps?
Stages represent logical phases of the pipeline. Steps are individual tasks executed within a stage.

-----------------------------------------------------------
SECTION 3: JENKINS FOR ENGINEERS WITH OTHER CI EXPERIENCE
-----------------------------------------------------------

Q8. How is Jenkins different from GitHub Actions or GitLab CI?
Jenkins is self-hosted and highly customizable, while GitHub Actions and GitLab CI are managed services with tighter platform integration.

Q9. How does Jenkins scale?
Jenkins scales using a master-controller and multiple agents model, allowing parallel builds across nodes.

Q10. How are credentials handled in Jenkins?
Jenkins uses a centralized Credentials Manager to securely store secrets and inject them into pipelines at runtime.

Q11. How are pipelines triggered?
Via webhooks, SCM polling, scheduled cron jobs, or manual execution.

-----------------------------------------------------------
SECTION 4: DEBUGGING & TROUBLESHOOTING JENKINS
-----------------------------------------------------------

Q12. Pipeline is failing – how do you debug?
Start with console output, analyze stack traces, rerun failed stages, enable verbose logs, and validate environment dependencies.

Q13. Jenkins job stuck in queue?
Check agent availability, executor count, node labels, and offline agents.

Q14. Plugin-related failure?
Verify plugin compatibility, check Jenkins logs, upgrade or rollback plugins, and restart Jenkins safely.

Q15. Jenkins service not starting?
Inspect logs:
 /var/log/jenkins/jenkins.log
Check Java version, disk space, and corrupted plugins.

-----------------------------------------------------------
SECTION 5: INSTALLATION & CONFIGURATION
-----------------------------------------------------------

Q16. How to install Jenkins on Linux?
Install Java first, then Jenkins package using system package manager.

Q17. Default Jenkins port?
8080

Q18. What is JENKINS_HOME?
The directory where Jenkins stores jobs, plugins, configurations, and build history.

Q19. How do you secure Jenkins?
Enable authentication, role-based access control, HTTPS, secure credentials, and restrict anonymous access.

Q20. How do you backup Jenkins?
Backup the entire JENKINS_HOME directory.

-----------------------------------------------------------
SECTION 6: ADVANCED & SCENARIO-BASED QUESTIONS
-----------------------------------------------------------

Q21. What are Jenkins Shared Libraries?
Reusable pipeline code shared across multiple pipelines to enforce standards and reduce duplication.

Q22. How do you implement approvals?
Using manual input steps or environment-based approval gates.

Q23. How do you integrate Jenkins with Docker?
Run Jenkins agents inside Docker containers or execute build steps inside Docker images.

Q24. Best practices for Jenkins pipelines?
Pipeline as code, minimal plugins, shared libraries, small stages, proper cleanup, and version control.

Q25. Jenkins vs Azure DevOps?
Jenkins provides flexibility and control; Azure DevOps offers integrated SaaS CI/CD with reduced maintenance.

-----------------------------------------------------------
SECTION 7: PROFESSIONAL SUMMARY
-----------------------------------------------------------

Jenkins is a mature CI/CD automation platform that enables organizations to design scalable, secure, and customizable pipelines using pipeline-as-code, distributed agents, and extensive ecosystem integrations.

===========================================================
JENKINS – JNLP (JAVA NETWORK LAUNCH PROTOCOL) INTERVIEW Q&A
===========================================================

Q1. What is JNLP in Jenkins?
A1. JNLP (Java Network Launch Protocol) is a protocol used by Jenkins agents to connect to the Jenkins master. 
It enables agents to initiate a secure connection to the master, allowing jobs to be executed remotely.

Q2. Why is JNLP used instead of the master initiating the connection?
A2. JNLP allows agents behind firewalls, NAT, or restricted networks to connect to the master. 
The master does not need to reach the agent directly, which solves network accessibility issues.

Q3. How does a JNLP agent connect to Jenkins?
A3. Steps:
1. Download the agent.jar file from Jenkins master.
2. Run the agent with the JNLP URL and secret:
   java -jar agent.jar -jnlpUrl http://<jenkins-url>/computer/<agent-name>/slave-agent.jnlp -secret <agent-secret>
3. The agent establishes a connecti
