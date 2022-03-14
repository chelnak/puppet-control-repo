class profile::modules_11290 {
  if $::operatingsystem == 'windows' {
    $path = 'c:\test.ini'
  } else {
    $path = '/tmp/test.ini'
  }

  $defaults = { 'path' => $path }
  $example = { 'section1' => { 'testsetting1' => 'testvalue1' } }
  inifile::create_ini_settings($example, $defaults)

}
