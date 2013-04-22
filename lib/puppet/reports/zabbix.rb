require 'puppet'
require 'yaml'
require 'rubygems'

begin
  require 'zabbix_send'
rescue LoadError => e
  Puppet.info "You need the `zabbix` gem to use the zabbix reporter"
end

Puppet::Reports.register_report(:zabbix) do

  configfile = File.join([File.dirname(Puppet.settings[:config]), "zabbix.yaml"])
  raise(Puppet::ParseError, "zabbix report config file #{configfile} not readable") unless File.exist?(configfile)
  config = YAML.load_file(configfile)
  ZABBIX_SERVER = config[:zabbix_server]
  ZABBIX_PORT = config[:zabbix_port]
  FAILED_RUN_KEY = config[:failed_run_key]

  desc <<-DESC
    Send notification of failed reports to a zabbix server via zabbix_sender gem.
  DESC

  def process
    if self.status == 'failed'
      Puppet.debug "Sending failure notification for #{self.host} to zabbix server at #{ZABBIX_SERVER}"
      sender = ZabbixSend::Sender.new
      sender.send("#{ZABBIX_SERVER}","#{self.host}","#{FAILED_RUN_KEY}","1")
    end
  end 
end
