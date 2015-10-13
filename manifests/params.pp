# authconfig::params
class authconfig::params () {

  $packages           = ['authconfig']
  $cache_packages     = ['nscd']
  $ldap_packages      = $::operatingsystemmajrelease ? {
    5       => ['openldap-clients', 'nss_ldap-253'],
    7       => ['openldap-clients', 'nss-pam-ldapd'],
    default => ['openldap-clients', 'nss-pam-ldapd', 'pam_ldap']
  }
  $krb5_packages      = ['pam_krb5', 'krb5-workstation']
  $mkhomedir_packages = $::operatingsystemmajrelease ? {
    5       => ['pam'],
    default => ['oddjob-mkhomedir']
  }
  $nis_packages       = ['ypbind']
  $nis_services       = ['ypbind']
  $services           = []
  $cache_services     = ['nscd']

  # RHEL 5 Doesn't have nslcd package available.
  $ldap_services      = $::operatingsystemmajrelease ? {
    5       => [],
    default => ['nslcd'],
  }   

}
