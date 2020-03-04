class exim::config {

  $relay_to_domains_txt = join($exim::relay_to_domains, ' : ')
  $relay_from_hosts_txt = join($exim::relay_from_hosts + ['localhost'], ' : ')
  $daemon_smtp_ports_txt = join($exim::daemon_smtp_ports, ' : ')
  $never_users_txt = join($exim::never_users, ' : ')
  $host_lookup_txt = join($exim::host_lookup, ' : ')
  $sender_unqualified_hosts_txt = join($exim::sender_unqualified_hosts, ' : ')
  $recipient_unqualified_hosts_txt = join($exim::recipient_unqualified_hosts, ' : ')

  file {
    $exim::config_file:
      ensure  => 'present',
      owner   => 'root',
      group   => $exim::service_group,
      mode    => '0440',
      content => template('exim/exim.conf.erb'),
      notify  => Service[$exim::service_name];
  }

  if $exim::tls_enabled {
    file {
      $exim::tls_certificate_path:
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0444',
        content => "${exim::tls_certificate_content}\n",
        notify  => Service[$exim::service_name];

      $exim::tls_privatekey_path:
        ensure    => 'present',
        owner     => 'root',
        group     => $exim::service_group,
        mode      => '0440',
        content   => "${exim::tls_privatekey_content}\n",
        show_diff => false,
        notify    => Service[$exim::service_name];
    }

    # Because file will contain LDAP password
    if $exim::auth_ldap_enable {
      File[$exim::config_file] {
        show_diff => false,
      }
    }
  }

  service {
    $exim::service_name:
      ensure => 'running',
      enable => true;
  }
}