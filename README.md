vg-php-box
==========

CentOS 6.4 (64-bit) vagrant box to develop apache/PHP projects

<img height="64" src="http://www.vagrantup.com/images/logo_vagrant-81478652.png"/>

Vagrant puts together your complete development environment. Say goodbye to the "works on my machine" excuse as Vagrant creates identical development environments for everyone on your team.

If you're curious what benefits Vagrant has to offer, you should also read the <a href="http://docs.vagrantup.com/v2/why-vagrant/">"Why Vagrant?"</a> page.

## Requirements

<img height="94" align="right" src="https://forums.virtualbox.org/styles/prosilver/imageset/vbox_94px.png"/>

Download and install <a href="https://www.virtualbox.org/wiki/Downloads">VirtualBox</a>

Download and install <a href="http://www.vagrantup.com/downloads">Vagrant</a>

## Vagrant box

Instead of building a virtual machine from scratch, which would be a slow and tedious process, Vagrant uses a base image to quickly clone a virtual machine. These base images are known as boxes in Vagrant.

The best place to find boxes is <a href="https://vagrantcloud.com">Vagrant Cloud</a>.

I'm going to use <a href="https://vagrantcloud.com/box-cutter/centos64">CentOS 6.4 (64-bit)</a> as base image.

## Get started

Type this commands to boot the vagrant box, ssh into it, save the current running state of the machine and stop it, and remove all traces:

`$ vagrant up`

`$ vagrant ssh`

`$ vagrant suspend`

`$ vagrant destroy`

By default, Vagrant shares your project directory (where Vagrantfile is located) to the /vagrant directory in your virtual box. This means you can edit your project files using your favourite IDE.