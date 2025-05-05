### How to run?

1. Clone the repo
2. Move to the folder that contains the docker compose file
3. Configure the gitlab runner

- Go to to the gitlab CICD settings page for the repository
- Copy and paste the url and the token to the runner script file `mounted/gitlab/scripts/register-and-start.sh`

```
if [ ! -f /etc/gitlab-runner/config.toml ]; then
    gitlab-runner register \
        --non-interactive \
        # go to the gitlab CICD settings page for the repository
        # copy and paste the url and the token
        --url "URL_HERE" \
        --registration-token "TOKEN_HERE" \
        --executor "shell" \
        --description "SECOND-BRAIN documentation runner" \
        --tag-list "pull-code" \
        --run-untagged="false" \
        --locked="false"
fi
```
- We are using the GitLab runner in a container to pull the new changes from the remote, so we should give it a chance to pull by setting up the GitLab credentials

Go to `mounted/gitlab/environments/gitlab.env`.
Paste your `Personal Access Token` and `Username` to the file.

4. Create docker network `docker network create second-brain-network`
5. Run compose `docker compose up -d`