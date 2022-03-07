# Fast FTP Action

Automate deploying websites and more with this GitHub action.

## Example
```yml
name: Publish Website

on: push

jobs:
  Fast-FTP-Action:
    name: Fast FTP Action
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2

    - name: Fast FTP Action
      uses: anvil-solutions/Fast-FTP-Action@2.1.0
      with:
        server: ftp.samkirkland.com
		port: 2222
        username: myFtpUserName
        password: ${{ secrets.FTP_PASSWORD }}
```

1. Select the repository you want to add the action to
2. Select `Blank workflow file` or `Set up a workflow yourself`, if you don't see these options manually create a yaml file `Your_Project/.github/workflows/main.yml`
3. Paste the above code into your file and save
4. Now you need to add a key to the `secrets` section in your project. To add a `secret` go to the `Settings` tab in your project then select `Secrets`. Add a new `Secret` for `FTP_PASSWORD`

## Settings
Keys can be added directly to your .yml config file or referenced from your project `Secrets` storage.

To add a `secret` go to the `Settings` tab in your project then select `Secrets`.
I recommend you store your FTP_PASSWORD as a secret.

| Key Name       | Required? | Example                    | Default         | Description                 |
|----------------|-----------|----------------------------|-----------------|-----------------------------|
| `server`       | Yes       | ftp.samkirkland.com        | N/A             | FTP server                  |
| `username`     | Yes       | git-action@samkirkland.com | N/A             | FTP username                |
| `password`     | Yes       | CrazyUniquePassword&%123   | N/A             | FTP password                |
| `method`       | No        | sftp                       | ftp             | Protocol used (ftp or sftp) |
| `local_dir`    | No        | ./build                    | .               | The local folder to copy, defaults to root project folder. |
| `remote_dir`   | No        | ./serverFolder             | .               | The remote folder to copy to, deafults to root FTP folder. |
| `port`         | No        | 2222                       | 22              | The remote port.            |
