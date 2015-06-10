#rails-vagrant-starter [![Stories in Ready](https://badge.waffle.io/luctus/rails-vagrant-starter.svg)](http://waffle.io/luctus/rails-vagrant-starter)

All you need to start a new Rails / Nginx / Passenger / Mysql project with **Vagrant** and **Chef**.

Just clone this repo, change the origin and type ```vagrant up```

###What am I going to install (with chef)?
- ruby 2.2.0 (rbenv)
- rails (latest stable version)
- passenger 5.0.0.rc2
- mysql (user: root | pass: admin)
- nginx 1.7.10

###Ok, What should I do?
```cmd
$ git clone git@github.com:luctus/rails-vagrant-starter.git my_app
$ cd my_app
my_app $ git remote set-url origin my_app_repo_url
my_app $ git push
my_app $ cd vagrant
```

Now update the file at ```vagrant/Vagrantfile```, changing the name of the VM, from "STARTER" to a new referring your project, so this line:

```
vb.customize ["modifyvm", :id, "--name", "STARTER"]
```

should be like this one:

```
vb.customize ["modifyvm", :id, "--name", "MY_APP"]
```

You are ready to go, just type (and wait):
```
my_app/vagrant $ vagrant up
```
Once it ends, let's go into the VM and create the rails project:
```
my_app/vagrant $ vagrant ssh
vagrant $ cd /starter
starter $ gem update --system
starter $ rails new ../starter
starter $ bundle install --no-deployment; bundle install --deployment
starter $ bin/rake db:create
starter $ touch tmp/restart.txt
```

Now visit the ip defined in the ```Vagrantfile``` in your browser.

### What's next?
- You should delete the README.md file (because you'll see this one!)

### Questions?
If you have any question about the propuse of this repo or anything else, just create an issue.
