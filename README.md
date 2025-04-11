# Tools

## rsync_helper
`rsync_helper` is a simple script that wraps rsync allowing a source and remote to be pre-configured in a local file for ease of use.

### Usage
The script expects an .env file to define remote connection details.

Create the .env file at:

```bash
mkdir -p ~/.config/rsync
[nvim/vim/nano] ~/.config/rsync/.env
```

Add the following environment variables (customizse as needed):


```ini
RSYNC_REMOTE_USER=user
RSYNC_REMOTE_HOST=yourserver.com
RSYNC_REMOTE_DIR=/var/www/main_project
RSYNC_LOCAL_DIR=$HOME/project
```

Then to sync changes to the remote it's as simple as running:

```bash
rsync_helper push
```
Optionally it can be called with the standard rsync flags, e.g.:

```bash
rsync_helper push --dry-run --exclude="*.log"
```

