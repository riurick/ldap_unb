require File.dirname(__FILE__) + '/../../../../test/test_helper'

class LdapUnbPluginTest < ActiveSupport::TestCase

  should "not allow user registration" do
    plugin = LdapUnbPlugin.new
    assert plugin.allow_user_registration
  end

  should "not allow password recovery" do
    plugin = LdapUnbPlugin.new
    assert !plugin.allow_password_recovery
  end

end
