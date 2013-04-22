puppet-zabbix
==============

NB NB NB NB - CURRENTLY UNTESTED

Description
-----------

A puppet report processor to send metrics and notify zabbix server of failed runs.

Requirements
------------

* `zabbix_sender` gem
* `Puppet`
* A [zabbix](http://zabbix.sourceforge.net/) server

Installation & Usage
--------------------

1.  Install the `zabbix_sender` gem on your Puppet master

        $ sudo gem install zabbix_sender

2.  Install puppet-zabbix-report as a module in your Puppet master's module
    path.

3.  Update the `zabbix_server`, `zabbix_port` and relevant zabbix key variables in the `zabbix.yaml` file with 
    your zabbix server IP and port and copy the file to `/etc/puppet/`. An example file is included.

4.  Enable pluginsync and reports on your master and clients in `puppet.conf`

        [master]
        report = true
        reports = zabbix
        pluginsync = true
        [agent]
        report = true
        pluginsync = true

5.  Run the Puppet client and sync the report as a plugin

Author
------

Andrew Stangl <andrewstangl@gmail.com>


License
-------

    Author:: Andrew Stangl (<andrewstangl@gmail.com>)
    Copyright:: Copyright (c) 2011 Andrew Stangl
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
