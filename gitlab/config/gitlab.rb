gitlab_rails['gitlab_shell_ssh_port'] = 2424

external_url 'http://gitlab.enblitz.com'
# gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password').gsub("\n", "")

letsencrypt['enable'] = false
nginx['leason_port'] = 80
nginx['leason_https'] = false


