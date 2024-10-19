# gatekeeper

send webhooks to this app to run github user management

## Developer setup

- create a github organization for testing
- create a PAT(classic) that has full access
- create a workflow to call (or use github user management workflow)
- etup webhooks at organization level for repository events

### required env variables

```bash
GITHUB_DISPATCH_URL=https://api.github.com/repos/<GITHUB_ORG_NAME>/<GITHUB_REPO_NAME>/actions/workflows/sync.yaml/dispatches
GITHUB_TOKEN=<PAT_TOKEN>
```