class profile::modules_11300 {
  #$config_path = '-config="%PROGRAMDATA%\nomad\conf\client.hcl"'
  $username = 'atest\withbackslash'
  $password = Sensitive('atest@@&&complexPass:><!?&workd')
  package {'nomad':
    ensure          => latest,
    install_options => [
      '--pre',
      "--package-parameters=\'/Username:${username}\'",
      "--package-parameters-sensitive=\'/Password:${password}\'",
    ],
    provider        => 'chocolatey',
  }
}
