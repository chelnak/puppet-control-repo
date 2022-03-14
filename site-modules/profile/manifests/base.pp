class profile::base {

  #the base profile should include component modules that will be on all nodes
  include stdlib

  case $operatingsystem {
    'windows': {
      include chocolatey

      chocolateyfeature {'allowGlobalConfirmation':
        ensure => enabled,
      }

      package { 'vscode':
        ensure   => 'present',
        provider => 'chocolatey'
      }

      package { 'git':
        ensure   => 'present',
        provider => 'chocolatey'
      }

      package { 'pdk':
        ensure   => 'present',
        provider => 'chocolatey'
      }

      package { 'microsoft-edge':
        ensure   => 'present',
        provider => 'chocolatey',
      }
    }
  }
}
