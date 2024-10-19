# gatekeeper

send webhooks to this app to run github user management

## Developer setup

- Create a GitHub organization for testing
- Create a fine-grained access token
  - Restrict to a single repository that contains the workflow(s) you want to trigger
  - Repository permissions should be:
    - Read access to metadata
    - Read and write access to actions
- Create a workflow to call (or use github user management workflow)
- Setup webhooks at organization level:
  * Trigger events: repository events
  * Content type = `application/json`
  * Create webhooks here: https://github.com/organizations/<GITHUB_ORG_NAME/settings/hooks)

### Required env variables

```bash
GITHUB_DISPATCH_URL=https://api.github.com/repos/<GITHUB_ORG_NAME>/<GITHUB_REPO_NAME>/actions/workflows/<WORKFLOW_TO_CALL>.yaml/dispatches
GITHUB_TOKEN=<PAT_TOKEN>
```

