class profile::gh_833 {
  file { '/usr/local/share/tmp_docker':
    ensure => directory
  }

  class { 'docker':
    log_driver => 'journald',
  }

  $compose = "compose_test:
    image: ubuntu:14.04
    command: /bin/sh -c 'while true; do echo hello world; sleep 1; done'
  "

  file { '/tmp/compose.yml':
    content => $compose
  }

  class { 'docker::compose':
    ensure => present,
  }

  docker_compose {'test':
    ensure => present,
    compose_files => [
      '/tmp/compose.yml'
    ],
    tmpdir => '/usr/local/share/tmp_docker',
    scale  => {
      compose_test => 3
    },
  }

  docker_network { 'test-network':
    ensure   => present,
    subnet   => '192.168.1.0/24',
    gateway  => '192.168.1.1',
    ip_range => '192.168.1.4/32',
  }

  docker_volume { 'test-volume':
    ensure => present,
  }
}
