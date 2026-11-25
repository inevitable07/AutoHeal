cd /etc/puppetlabs/code/environments/production/modules

sudo mkdir -p autoheal/manifests
sudo mkdir -p autoheal/files
## path to nginx.pp = sudo nano autoheal/manifests/nginx.pp

class autoheal::nginx {

  package { 'nginx':
    ensure => installed,
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    source  => 'puppet:///modules/autoheal/index.html',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    require => Package['nginx'],
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    require   => Package['nginx'],
    subscribe => File['/var/www/html/index.html'],
  }

}
