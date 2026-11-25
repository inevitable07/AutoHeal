Path = sudo nano /etc/puppetlabs/code/environments/production/manifests/site.pp

node default {
  include autoheal::nginx
}