# Keymaster host:
# Create key storage; create, regenerate, and remove key pairs
class sshkeys::keymaster {
  include sshkeys::var
  notice($sshkeys::var::keymaster_storage)
  file { $sshkeys::var::keymaster_storage:
    ensure => directory,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
    mode   => '0644',
  }
  # Realize all virtual master keys
  Sshkeys::Setup_key_master <| |>
}
