#
# Author:: Jeune Asuncion (<ops@applovin.com>)
# Copyright:: Copyright (c) 2012 Jeune Asuncion
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/knife/ipmi_base'

class Chef
  class Knife
    class IpmiConsoleActivate < Knife
      include Knife::IpmiBase

      banner "knife ipmi console activate NODE"

      def run
        ip = server.applovin.ipmi.ip
        pid = fork { 
          exec("ipmitool -U #{ipmi_user} -P #{ipmi_pass} -H #{ip} -I lanplus sol activate")
        }

        Process.waitpid2(pid)
      end
    end
  end
end
