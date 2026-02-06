############################################################
# PROJECT MANAGEMENT & AGILE
############################################################

=======================
1. AGILE – COMPLETE EXPLANATION
=======================

Definition:
Agile is a flexible, iterative approach to software development that emphasizes:
- Customer collaboration over contract negotiation
- Working software over comprehensive documentation
- Responding to change over following a rigid plan
- Individuals and interactions over processes and tools

Agile is a mindset and methodology based on the **12 Agile Principles** from the Agile Manifesto.

Purpose:
- Deliver working software frequently (short iterations)
- Increase collaboration between stakeholders and development team
- Allow adaptability to changing business requirements
- Promote continuous improvement

---

Types of Agile:
1. **Scrum**
   - Most widely used framework
   - Iterative, with time-boxed sprints
2. **Kanban**
   - Visual workflow management
   - Focus on continuous delivery and limiting work in progress
3. **Lean**
   - Minimize waste, maximize value
   - Focus on customer value and efficient processes
4. **Extreme Programming (XP)**
   - Emphasizes technical excellence
   - Frequent releases, test-driven development (TDD)
5. **Crystal**
   - Lightweight framework, adaptable
   - Emphasizes people and interactions over processes
6. **SAFe (Scaled Agile Framework)**
   - Agile at enterprise scale
   - Combines Scrum, XP, and Lean principles
7. **DSDM (Dynamic Systems Development Method)**
   - Focus on fixed time, cost, and quality
   - Agile delivery with business involvement

---

=======================
2. SCRUM FRAMEWORK – COMPLETE DETAILS
=======================

Definition:
Scrum is a subset of Agile that provides a structured framework for iterative development, emphasizing collaboration, accountability, and iterative progress toward a well-defined goal.

Roles:
1. **Product Owner (PO)**:
   - Defines features and priorities
   - Maintains the product backlog
   - Represents stakeholders
2. **Scrum Master (SM)**:
   - Facilitates Scrum ceremonies
   - Removes blockers for the team
   - Ensures Scrum practices are followed
3. **Development Team**:
   - Cross-functional team (developers, testers, designers)
   - Responsible for delivering a potentially shippable product increment each sprint

Artifacts:
1. **Product Backlog**: Master list of features, bug fixes, enhancements, technical tasks
2. **Sprint Backlog**: Selected tasks for the current sprint
3. **Increment**: Completed work that meets the definition of done
4. **Burndown Chart**: Visual representation of remaining work in a sprint

Events / Ceremonies:
1. **Sprint Planning** (1–4 hours for 2-week sprint):
   - Define sprint goal
   - Select backlog items
   - Break into tasks
2. **Daily Stand-Up** (~15 minutes):
   - Each member answers:
     1. What did I do yesterday?
     2. What will I do today?
     3. Any blockers?
3. **Sprint Review** (1–2 hours):
   - Demonstrate completed work to stakeholders
   - Collect feedback
4. **Sprint Retrospective** (30–60 minutes):
   - Team reflects on:
     - What went well
     - What didn’t go well
     - Actionable improvements
5. **Backlog Refinement** (~5–10% of sprint):
   - Review, clarify, estimate, and prioritize backlog items

Timing:
- Typical sprint: 1–4 weeks (most common: 2 weeks)
- Daily stand-ups: 15 mins
- Sprint planning: 1–4 hours (depending on sprint length)
- Sprint review & retrospective: 1–2 hours

Benefits:
- Predictable delivery
- Improved collaboration
- Continuous feedback
- Flexibility for changing requirements

---

=======================
3. JIRA & SERVICENOW Q&A
=======================

Q1. What is Jira and why is it used?
A1. Jira is a project management and issue-tracking tool widely used in Agile and DevOps. 
    It helps manage product backlog, sprints, epics, user stories, bugs, and tasks. 
    Provides dashboards, reports, and workflow customization for tracking project progress.

Q2. What are epics, stories, and tasks in Jira?
A2. - **Epic:** Large feature or requirement
    - **Story:** Work item delivering a user feature
    - **Task/Sub-task:** Smaller work units within a story

Q3. What is a Jira workflow?
A3. A workflow defines the states of an issue (e.g., To Do → In Progress → In Review → Done) and transitions between them. 
    Workflows can be customized per team/project.

Q4. What is ServiceNow and its relevance to Agile?
A4. ServiceNow is a platform for IT service management (ITSM), operations, and workflow automation. 
    In Agile/DevOps context, it is used for:
    - Tracking incidents, problems, and change requests
    - Integrating ITSM with DevOps pipelines
    - Automating approvals and task assignments

Q5. Can Jira and ServiceNow integrate?
A5. Yes, they can integrate via APIs or connectors to:
    - Synchronize incidents and tasks
    - Trigger DevOps pipelines for changes
    - Provide end-to-end traceability from issue to deployment

# ADDITIONAL JIRA / AGILE INTERVIEW Q&A

Q7. What is the difference between Scrum and Kanban boards?
A7. 
- **Scrum Board:** 
  - Used in Scrum methodology with **time-boxed sprints** (1–4 weeks).  
  - Tasks move through columns such as To Do → In Progress → Done **within a sprint**.  
  - Sprint backlog is fixed for the sprint duration; work is planned in advance.
- **Kanban Board:** 
  - Used in Kanban methodology with **continuous flow** (no fixed sprints).  
  - Emphasizes **work in progress (WIP) limits** to improve flow efficiency.  
  - Tasks are pulled into the workflow as capacity becomes available.  
- **Key Difference:** Scrum focuses on **iterations and sprints**, while Kanban focuses on **continuous delivery and flow management**.

Q8. How do you estimate user stories?
A8. 
- **Story Points:** A relative measure of effort, complexity, and risk for a story.  
  - Typically estimated using **Planning Poker** or consensus among team members.  
  - Helps compare tasks without assigning absolute time.
- **Hours/Days:** Assign a rough time estimate for implementation.  
  - Less common in pure Agile, but can be used for sprint planning in smaller teams.
- **Best Practice:** Use story points for **velocity tracking** and sprint forecasting; focus on **relative effort** rather than exact hours.

Q9. How do you prioritize backlog items?
A9. 
- **Value-Based Prioritization:** Prioritize features delivering the **highest business value**.  
- **Risk-Based Prioritization:** Address **high-risk or high-dependency items** early.  
- **MoSCoW Method:** Classify items as Must-have, Should-have, Could-have, Won’t-have.  
- **Weighted Shortest Job First (WSJF):** Used in SAFe for enterprise prioritization.  
- **Key Principle:** Product Owner owns prioritization; decisions should align with business goals and customer needs.

Q10. How do you track sprint progress using burndown or velocity charts?
A10. 
- **Burndown Chart:**  
  - Shows the **remaining work** in a sprint or release over time.  
  - Helps visualize if the team is on track to complete the sprint goal.  
  - Ideal for identifying potential delays early.
- **Velocity Chart:**  
  - Shows the **amount of work (story points) completed in each sprint**.  
  - Helps forecast capacity for future sprints.  
  - Useful for sprint planning, release planning, and team performance evaluation.
- **Key Insight:** Burndown focuses on **progress within a sprint**, velocity focuses on **team throughput across sprints**.

---

=======================
4. PROJECT MANAGEMENT INTERVIEW Q&A
=======================

Q1. What is the difference between Agile and Waterfall?
A1. Agile is iterative, flexible, and focused on delivering working increments, while Waterfall is linear, sequential, and emphasizes completing one phase before moving to the next.

Q2. What are the benefits of Agile in software development?
A2. - Faster delivery of features
    - Early stakeholder feedback
    - Improved team collaboration
    - Adaptability to changing requirements
    - Continuous improvement

Q3. How do you handle changes in Agile during a sprint?
A3. Changes should ideally be added to the product backlog and prioritized in the next sprint. Immediate changes can be accommodated if the sprint goal allows, but scope creep should be avoided.

Q4. What metrics do you use to track project progress in Agile?
A4. - Velocity: Story points completed per sprint
    - Burndown chart: Remaining work in sprint
    - Cumulative flow diagram: Work in different states
    - Lead time & cycle time: Delivery speed

Q5. How do you manage risks in Agile projects?
A5. - Continuous backlog refinement and prioritization
    - Regular retrospectives to identify process issues
    - Early testing and integration
    - Transparent communication with stakeholders

Q6. How do you handle distributed teams in Agile?
A6. - Use collaboration tools (Jira, Confluence, MS Teams, Slack)
    - Time-zone aware sprint planning
    - Daily stand-ups using video conferencing
    - Shared documentation for clarity

Q7. How do you ensure quality in Agile?
A7. - Continuous integration and automated testing
    - Peer code reviews
    - Definition of Done for every story
    - Test-driven development (TDD) or Behavior-driven development (BDD)

Q8. Can Agile be used outside software projects?
A8. Yes, Agile principles are applicable to marketing, HR, operations, or any project requiring flexibility, iterative progress, and collaboration.

---
