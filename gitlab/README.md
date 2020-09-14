## gitlab配置域名
### 修改/data/gitlab/gitlab.rb
```
external_url 'https://gitlab.bytes-space.com'
gitlab_rails['gitlab_ssh_host'] = 'gitlab.bytes-space.com'
gitlab_rails['gitlab_shell_ssh_port']=40722
```
