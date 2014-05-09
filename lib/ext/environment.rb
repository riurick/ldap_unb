require_dependency 'environment'

class Environment

  settings_items :ldap_unb_plugin, :type => :hash, :default => {}

  validates_presence_of :ldap_unb_plugin_host, :if => lambda {|env| !env.ldap_unb_plugin.blank? }

  def ldap_unb_plugin_attributes
    self.ldap_unb_plugin || {}
  end

  def ldap_unb_plugin_host= host
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['host'] = host
  end

  def ldap_unb_plugin_host
    self.ldap_unb_plugin['host']
  end

  def ldap_unb_plugin_port= port
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['port'] = port
  end

  def ldap_unb_plugin_port
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['port'] ||= 389
    self.ldap_unb_plugin['port']
  end

  def ldap_unb_plugin_account
    self.ldap_unb_plugin['account']
  end

  def ldap_unb_plugin_account= account
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['account'] = account
  end

  def ldap_unb_plugin_account_password
    self.ldap_unb_plugin['account_password']
  end

  def ldap_unb_plugin_account_password= password
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['account_password'] = password
  end

  def ldap_unb_plugin_base_dn
    self.ldap_unb_plugin['base_dn']
  end

  def ldap_unb_plugin_base_dn= base_dn
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['base_dn'] =  base_dn
  end

  def ldap_unb_plugin_attr_login
    self.ldap_unb_plugin['attr_login']
  end

  def ldap_unb_plugin_attr_login= login
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['attr_login'] = login
  end

  def ldap_unb_plugin_attr_fullname
    self.ldap_unb_plugin['attr_fullname']
  end

  def ldap_unb_plugin_attr_fullname= fullname
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['attr_fullname'] = fullname
  end

  def ldap_unb_plugin_attr_mail
    self.ldap_unb_plugin['attr_mail']
  end

  def ldap_unb_plugin_attr_mail= mail
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['attr_mail'] =  mail
  end

  def ldap_unb_plugin_onthefly_register
    self.ldap_unb_plugin['onthefly_register'].to_s == 'true'
  end

  def ldap_unb_plugin_onthefly_register= value
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['onthefly_register'] = (value.to_s == '1') ? true : false
  end

  def ldap_unb_plugin_filter
    self.ldap_unb_plugin['filter']
  end

  def ldap_unb_plugin_filter= filter
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['filter'] = filter
  end

  def ldap_unb_plugin_tls
    self.ldap_unb_plugin['tls'] ||= false
  end

  def ldap_unb_plugin_tls= value
    self.ldap_unb_plugin = {} if self.ldap_unb_plugin.blank?
    self.ldap_unb_plugin['tls'] = (value.to_s == '1') ? true : false
  end

end
