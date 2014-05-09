require File.dirname(__FILE__) + '/ldap_authentication.rb'

class LdapUnbPlugin < Noosfero::Plugin

  def self.plugin_name
    "LdapUnb"
  end

  def self.plugin_description
    _("Plugin de suporte ao LDAP-UnB.")
  end

  def allow_user_registration
    true
  end

  def allow_password_recovery
    false
  end

  def stylesheet?
    true
  end
  
  def signup_extra_contents
    lambda {
      content_tag(:div, required(labelled_form_field(_('Matrícula'), text_field(:profile_data, :matricula, :id => 'matricula_field'))) +
      content_tag(:small, _('Insira uma Matrícula com somente números.'), :id => 'matricula-balloon'), :id => 'signup_matricula')+
      javascript_include_tag('../plugins/ldap_unb/javascripts/jquery.balloon')
    }
  end

  def account_controller_filters
    local_context = context
    block = lambda do
      if request.post?
        ldap = LdapAuthentication.new(local_context.environment.ldap_unb_plugin_attributes)
        login = local_context.params[:profile_data][:matricula]
        password = local_context.params[:user][:password]
        erro = ""

        begin
          auth = ldap.authenticate(login, password)
        rescue Net::LDAP::LdapError => e
          puts "LDAP is not configured correctly"
          erro = "Error!"
        end
        if !auth
          
          @person = Person.new(:environment => environment)
          @person.errors.add(:matricula, _( erro +' validation failed.'))
          render :action => :signup
        end
      end
    end

    [{ :type => 'before_filter',
      :method_name => 'validate_matricula',
      :options => {:only => 'signup'},
      :block => block}]

 
  end
=begin
  def login_extra_contents
    lambda {
      content_tag('div', labelled_form_field(_('Username / Matrícula'), text_field_tag('login', '', :id => 'matricula_field_login')) +
      labelled_form_field(_('Password'), password_field_tag('password', '', :id => 'matricula_field_password')), :id => 'matricula-login-fields')
    }
  end
=end
  def alternative_authentication
      
=begin
    environment = context.environment
    person = Person.find_by_matricula(params[:user][:login])
    ldap = LdapAuthentication.new(environment.ldap_unb_plugin_attributes)
    login = params[:user][:login]
    password = params[:user][:password]
    begin
      attrs = ldap.authenticate(login, password)
    rescue Net::LDAP::LdapError => e
      puts "LDAP is not configured correctly"
    end
   
    if person && attrs
      user = User.authenticate(person.user.login, params[:user][:password])  
    else
      ldap = LdapAuthentication.new(environment.ldap_unb_plugin_attributes)
      login = User.find_by_login(params[:user][:login]).person.matricula
      password = params[:user][:password]
      
      begin
        aux = ldap.authenticate(login, password)
      rescue Net::LDAP::LdapError => e
        puts "LDAP is not configured correctly"
      end
      if aux
        user = User.authenticate(params[:user][:login], params[:password])
      else
        session[:notice] = _('Incorrect username or password') 
        render :action => 'login'
      end
    end
    user
=end
    
    person = Person.find_by_matricula(context.params[:user][:login])
    if person
      user = User.authenticate(person.user.login, context.params[:user][:password])
    else
      user = User.authenticate(context.params[:user][:login], context.params[:user][:password])
    end
    user
  end

  def profile_info_extra_contents
    if context.profile.person?
      matricula = context.profile.matricula
      lambda {
        content_tag('div', labelled_form_field(_('Matrícula'), text_field_tag('profile_data[matricula]', matricula, :id => 'matricula_field', :disabled => true, :size => 30) ),:style => 'font-weight: bold;')
      }
    end
  end

end
