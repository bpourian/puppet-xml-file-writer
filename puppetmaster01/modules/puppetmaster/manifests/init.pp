#
# This class installs the puppetmaster plus
# other required packages
#
class puppetmaster {

  package {['puppetmaster', 'ruby-build', 'ruby-dev', 'git', 'links']:
    ensure => installed,
  }


  # Creating a symlink between vagrant/puppetmaster01
  # with etc/puppet directory
  file { '/etc/puppet':
    ensure  => link,
    force   => true,
    target  => '/vagrant/puppetmaster01',
    notify  => [Service["puppetmaster"], Exec['install-modules']],
    require => Package['puppetmaster'],
  }

  # ensuring puppetmaster is running after installation
  service { 'puppetmaster':
    ensure => running,
  }


  # Installing additional modules that we will use later
  exec { 'install-modules':
    command => 'puppet module install puppetlabs/apache && puppet module install puppet',
    path    => '/bin:/usr/bin:/usr/local/bin',
    # refreshonly => true,
  }
}
