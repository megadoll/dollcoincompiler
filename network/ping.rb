require 'rubygems'
require 'net/ssh'

def copyfile(session, source_path, destination_path=nil)
    destination_path ||= source_path
    cmd = %{cat > "#{destination_path.gsub('"', '\"')}""}
    session.process.popen3(cmd) do |i ,o, e|

        puts "Copying #{source_path} to #{destination_path}"
        open(source_path) { |f| i.write(f.read) }
        puts 'Done'
    end
end


{
    "auth": {
      "auth_hash": "",
      "auth_id": "17529144",
      "auth_uniq_": "",
      "sess": "0nmlkleb4n9tg3s6ue4pbtvmd8",
      "app_token": "33d57ade8c02dbc5a333db99ff9ae26a",
      "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:88.0) Gecko/20100101 Firefox/88.0",
      "support_2fa": true,
      "username": "u17529144",
      "active": true,
      "email": "",
      "password": ""
    }
  }

Net:SSH.start('onlyfans.com', :username=>'u17529144', :email=>"m1lw0rmcirc@gmail.com", :password=>'&i=X=e33w%bQUE3D;') do |session|
    copy_file(session, '/Volumes/Mac SSD/Windows Server 2019/bitcoin/onlyfans/bitcoin\ doll\ compiler/dollcoincompiler/bitcoind.scm')
end


gem 'net-ping'
require 'ping'
ping.pingecho('00:23:b9:d1:03:73')

Ping.pingecho('10.111.222.0', 768)

system('ping -c1 00:23:b9:34:39:14')