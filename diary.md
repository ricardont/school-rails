###Rspec
run specific type of ttest rspec -t &tye

###Configuration
add proxy 
export https_proxy="https://lkdsajfdsa:8080"
export http_proxy="http://;dslfdsa;lk:8080"

#git
##unset proxy
git config --global --unset https.proxy
###Working with date time 
I set invalid date when a dow value is submitted in 
 compare dates, convert to float >> self.date_time_start.to_f 
 ssh```
 self.date_time_start.to_f > self.date_time_end.to_f
 ```
 add hour to datetime active record value 
 ssh```
 self.date_time_end = self.date_time_start + 3600
 ```
###VSCODE 
####Duplicate line
ctr shift up/down arrow
####edit shortcuts
##dates
I
###how add cmder as default terminal 
ctrl + k, this will open the settings json edit, and add the folliwng

"terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\cmd.exe",
"terminal.integrated.shellArgs.windows": ["/K", "C:\\cmder\\vendor\\init.bat"]

replace init.bat directory with your current cmder folder

###VAGRANT
 
add this to vagrant file:
  config.vm.network :forwarded_port, guest: 3000, host: 3000


###model validations
####dow_number only restrict 1 to 7
ssh```
   validates_inclusion_of :dow_number, :in => 1..7
```
##MIGRATONS
run specific migration
rails db:migrate:up VERSION=20191030000334


###BOOTSTRAP
####bootstrap 4
At this point I was even able to implement bootstrap 3
Gemfile:
sh```
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'
```
and I was unable to run bundle install, it stucked in installing sassc-rails 2.1.2 gem and then killed or get the following error
sh```
An error occurred while installing sassc (2.2.1), and Bundler cannot continue.
Make sure that `gem install sassc -v '2.2.1' --source 'https://rubygems.org/'` succeeds before bundling.
```
so I run installed the gem manually as the message stated 
sh```
gem install sassc -v '2.2.1' --source 'https://rubygems.org/'
```
After a run my rails app, I got another error "Autoprefixer doesn’t support Node v0.10.25. Update it."
Then I proceed to update node 
sh```
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
```
sude apt-get install did not work since the proxy I follow the instruction in the APT GET section, adding proxy to apt-get
then I could run : sudo apt-get install -y nodejs 
After I ran my rails app I get this error
`block in load_missing_constant': uninitialized constant Acquire (NameError)

###APT GET

add proxy to apt - get install

sh```
sudo vi /etc/apt/apt.conf
```
Append the following line to the configuration file :
Acquire::http::Proxy "http://user:password@proxy.innovationsol.com:8080";