# gatekeeper

send webhooks to this app to run github user management

## Developer setup

- create a github organization for testing
- [create a PAT(classic) that has full access](https://github.com/settings/tokens/new?scopes=repo,workflow,admin:org,write:packages,user,gist,notifications,admin:repo_hook,admin:public_key,admin:enterprise,audit_log,codespace,project,admin:gpg_key,admin:ssh_signing_key&description=GLUEOPS%20-%20DEV-FOR-GATEKEEPER)
- create a workflow to call (or use github user management workflow)
- setup webhooks at organization level:
  * Trigger events: repository events
  * Content type = `application/json`
  * Create webhooks here: https://github.com/organizations/<GITHUB_ORG_NAME/settings/hooks)

### required env variables

```bash
GITHUB_DISPATCH_URL=https://api.github.com/repos/<GITHUB_ORG_NAME>/<GITHUB_REPO_NAME>/actions/workflows/<WORKFLOW_TO_CALL>.yaml/dispatches
GITHUB_TOKEN=<PAT_TOKEN>
```

