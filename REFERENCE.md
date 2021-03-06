# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

* [`exim`](#exim): 
* [`exim::config`](#eximconfig): 
* [`exim::install`](#eximinstall): 
* [`exim::params`](#eximparams): 

**Data types**

* [`Exim::Time`](#eximtime): 

## Classes

### exim

The exim class.

#### Parameters

The following parameters are available in the `exim` class.

##### `package_name`

Data type: `String`



Default value: $exim::params::package_name

##### `service_name`

Data type: `String`



Default value: $exim::params::service_name

##### `service_user`

Data type: `String`



Default value: $exim::params::service_user

##### `service_group`

Data type: `String`



Default value: $exim::params::service_group

##### `config_file`

Data type: `String`



Default value: $exim::params::config_file

##### `primary_hostname`

Data type: `String`



Default value: $facts['fqdn']

##### `local_domains`

Data type: `Array[String]`



Default value: [$primary_hostname]

##### `relay_to_domains`

Data type: `Array[String]`



Default value: []

##### `relay_from_hosts`

Data type: `Array[String]`



Default value: []

##### `av_scanner_enable`

Data type: `Boolean`



Default value: `false`

##### `av_scanner`

Data type: `String`



Default value: 'clamd:/tmp/clamd'

##### `spamd_enable`

Data type: `Boolean`



Default value: `false`

##### `spamd_variant`

Data type: `Enum['variant =rspamd', '']`



Default value: ''

##### `spamd_address`

Data type: `Stdlib::Host`



Default value: 'localhost'

##### `spamd_port`

Data type: `Integer`



Default value: 783

##### `tls_enabled`

Data type: `Boolean`



Default value: `true`

##### `tls_certificate_path`

Data type: `String`



Default value: $exim::params::tls_certificate_path

##### `tls_certificate_content`

Data type: `Optional[String]`



Default value: `undef`

##### `tls_privatekey_path`

Data type: `String`



Default value: $exim::params::tls_privatekey_path

##### `tls_privatekey_content`

Data type: `Optional[String]`



Default value: `undef`

##### `daemon_smtp_ports`

Data type: `Array[Integer]`



Default value: [25, 465, 587]

##### `qualify_domain`

Data type: `String`



Default value: $facts['domain']

##### `qualify_recipient`

Data type: `String`



Default value: $qualify_domain

##### `allow_domain_literals`

Data type: `Boolean`



Default value: `false`

##### `never_users`

Data type: `Array[String]`



Default value: ['root']

##### `host_lookup`

Data type: `Array[String]`



Default value: ['*']

##### `rfc1413_enable`

Data type: `Boolean`



Default value: `false`

##### `rfc1413_hosts`

Data type: `Array[String]`



Default value: ['*']

##### `rfc1413_query_timeout`

Data type: `Exim::Time`



Default value: '5s'

##### `prdr_enable`

Data type: `Boolean`



Default value: `true`

##### `sender_unqualified_hosts`

Data type: `Array[String]`



Default value: []

##### `recipient_unqualified_hosts`

Data type: `Array[String]`



Default value: []

##### `log_selector`

Data type: `String`



Default value: '+smtp_protocol_error +smtp_syntax_error +tls_certificate_verified'

##### `ignore_bounce_errors_after`

Data type: `Exim::Time`



Default value: '2d'

##### `timeout_frozen_after`

Data type: `Exim::Time`



Default value: '7d'

##### `split_spool_directory`

Data type: `Boolean`



Default value: `true`

##### `check_rfc2047_length`

Data type: `Boolean`



Default value: `false`

##### `accept_8bitmime`

Data type: `Boolean`



Default value: `false`

##### `keep_environment`

Data type: `String`



Default value: '^LDAP'

##### `add_environment`

Data type: `String`



Default value: 'PATH=/usr/bin::/bin'

##### `domain_literal_enable`

Data type: `Boolean`



Default value: `false`

##### `smarthost_enable`

Data type: `Boolean`



Default value: `false`

##### `smarthost`

Data type: `Optional[Stdlib::Host]`



Default value: `undef`

##### `retries`

Data type: `String`



Default value: 'F,2h,15m; G,16h,1h,1.5; F,4d,6h'

##### `rewrites`

Data type: `Array[String]`



Default value: []

##### `auth_ldap_enable`

Data type: `Boolean`



Default value: `false`

##### `auth_server_set_id`

Data type: `Boolean`



Default value: `true`

##### `ldap_hostname`

Data type: `Optional[String]`



Default value: `undef`

##### `ldap_port`

Data type: `Integer`



Default value: 636

##### `ldap_require_cert`

Data type: `Enum['demand', 'allow', 'try', 'never']`



Default value: 'demand'

##### `ldap_ca_cert_file`

Data type: `String`



Default value: $exim::params::ldap_ca_cert_file

##### `ldap_base_dn`

Data type: `Optional[String]`



Default value: `undef`

##### `ldap_bind_dn`

Data type: `Optional[String]`



Default value: `undef`

##### `ldap_passwd`

Data type: `Optional[String]`



Default value: `undef`

##### `ldap_user_attrib`

Data type: `String`



Default value: 'sAMAccountName'

##### `ldap_auth_attrib`

Data type: `String`



Default value: 'userPrincipalName'

##### `ldap_filter`

Data type: `Optional[String]`



Default value: '(objectClass=user)'

##### `dkim_sign`

Data type: `Boolean`



Default value: `false`

##### `dkim_config_file`

Data type: `String`



Default value: $exim::params::dkim_config_file

##### `dkim_keys_path`

Data type: `String`



Default value: $exim::params::dkim_keys_path

##### `create_mta_fact`

Data type: `Boolean`



Default value: `true`

##### `mta_fact_file`

Data type: `String`



Default value: '/opt/puppetlabs/facter/facts.d/mta.yaml'

##### `dkim_keys`

Data type: `Hash[Stdlib::Fqdn, Struct[{'selector' => String, 'key' => String, 'strict' => Boolean}]]`



Default value: {}

### exim::config

The exim::config class.

### exim::install

The exim::install class.

### exim::params

The exim::params class.

## Data types

### Exim::Time

The Exim::Time data type.

Alias of `Pattern[/\A[0-9]+(d|h|m|s)\z/]`

