return {
  cmd = { 'docker-langserver', '--stdio' },
  filetypes = { 'dockerfile', 'yaml.docker-compose' },
  root_markers = { 'Dockerfile', 'yaml.docker-compose' },
}
