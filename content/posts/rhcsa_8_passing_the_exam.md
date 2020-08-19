+++ 
date = "2020-02-08"
title = "RHCSA - Passing the Exam"
slug = "rhcsa-passing-the-exam" 
tags = []
categories = []
series = ["Linux","Red Hat","IT","Education"]
+++

# Introduction
This has been quite an experience getting my RHCSA (Red Hat Certified System Administrator) 8. I learned a lot and have been really humbled by the amount of information I needed to retain to pass the exam. Red Hat does not joke around with the difficulty of their exams. This is by no means to scare you away, in the end it was totally worth it. 

I am going to take some time and break down what I did to pass this exam and to highlight the wonderful resources I used. If you want an easier way to pass the exam, do yourself a favor and get the [RHLS (Red Hat Learning Subscription)](https://www.redhat.com/en/services/training/learning-subscription). I have discussed with several others in the certification community and this is a wonderful resource. I did not have that kind of cash to pay for it and already had years of prior Linux experience.

# Where did I start?

## Red Hat Developer Subscription
This is a wonderful tool that allows you to download and use the latest versions of Red Hat and a lot of their other products for free. It is important to remember that this is meant for non-commercial use. If you want to use it for commercial purposes, you will need to purchase a license. You can get started by visiting this link: https://developers.redhat.com/register/ 

This will get you started in setting up a Red Hat Account. You will also need this account to register for the exam and for taking the exam.

![](/images/posts/rhcsa_8_passing_the_exam/create_red_hat_account.png)

Once created, as with most websites, you will need to verify your email address. Once confirmed and everything is looking good, you will want to go to the customer portal. https://access.redhat.com Should look something like this:

![](/images/posts/rhcsa_8_passing_the_exam/red_hat_portal.png)

To get started downloading Red Hat, you will want to go to the Downloads Section. This will allow you to download a copy of Red Hat to use for installing and testing in your lab environment.

![](/images/posts/rhcsa_8_passing_the_exam/download_rhel.png)

You will want to make sure that you download the Binary DVD Version. This will include all of the offline files for installing RHEL.

![](/images/posts/rhcsa_8_passing_the_exam/download_rhel2.png)

Once you have the Binary DVD ISO, you can get started building your learning lab and learning how to install it!

## Locate Some Learning Resources


Now that you have a Red Hat Developer Account and a copy of the ISO, I will give you my recommendation of learning resources for getting started on RHCSA. 

### My Favorites:
* **Sander Van Vugt RHCSA Courses** - Absolutely the best you are going to get for your money beyond the RHLS as I suggested above. He is an excellent instructor with years of experience. He has a great way of teaching the material concisely and making sure you have relevant labs for items that will be on the exam. His course also includes practice exams. 
  * At the time of this writing, this is his course on the O'Reilly Training Platform: [Training Course](https://learning.oreilly.com/learning-paths/red-hat-certified/8204091500000000003/) 
  * It is a bit steep for some folks at around $50 per month, but there is a 7 day free trial to test it out. 
  * He is the best of the best and highly recommended by more people than just me

* **Red Hat Documentation** - Their documentation is absolutely amazing. It's important to read through the objectives of the exam and find relevant documentation to read. Since you have a developer account, you have unlimited access to the documentation, so take advantage of it! 
  * Located here: [Red Hat Documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/)

### Resources I Would Avoid:
* **Linux Academy** - This may be a very controversial opinion, but I really found their RHCSA 8 training lacking. It did not cover the objectives in a very thorough manner and their labs lacked in a lot of areas. It's really sad, because I really like their mission and what they are setting out to do, but they really need to improve the quality of their training before I would recommend them for RHCSA. It doesn't help that they cost roughly the same as O'Reilly and the Sanders training, but not nearly as high of quality. About the only thing they got going for them is the access to Lab Resources, which honestly, you are better off building yourself and running locally. Gives you that much more insight and experience

* **Udemy** - Their training quality is all over the place, I would not recommend them unless someone has seen something there I have not.

* **ITProTV** - I have not seen their RHCSA content, but any training I have gotten from them has been super drawn out and full of filler. 40 hours of technical content is what they claim. In reality, you get 30 hours of banter and 10 hours of actual content.

## Join a Learning Community
The third and final item for getting started is to join a community of like minded individuals going for the certification. It will allow you to trade tips and tricks and ask questions of each other. It's a bit tricky with the exam being under NDA, but it's totally worth getting involved. You can learn so much by working with others on studying for the exam and it keeps you honest on how ready you are for it.

The best community I have had the pleasure of interacting with is rdbreak's [Red Hat Certs Slack Channel](https://join.slack.com/t/redhat-certs/shared_invite/enQtNTk1OTc2NzE3NTkxLTg4NDA2N2E1ZGI3YzZlZjU1YzNlNmVmYTA5ZmZjZmY1NDU2ODFkMGM1MWE5YTFkN2JlOTZmMTI5ZjQ1MzM3ZDI) It is a very active community of people working to try and pass the exam. I am definitely going to continue to use it to try and pass my RHCE next, so you will definitely see me in there.

Another cool thing about this community is it has practice environments that he has built that allow you to practice test. They are completely automated and it makes labbing that much easier if you are a beginner to Linux.

# Studying for the Exam
So, you got your Red Hat ISO, you found your study resource, and you joined a community, now what? In this section, I will give some suggestions of what I did to make my studying more beneficial.

## Install RHEL as your Desktop OS
Some long time Linux users may cringe at the thought of using RHEL as their day to day OS since it's meant for servers right? Here's my argument; You are forced to use it every day and troubleshoot when things go wrong. If you don't want to use it as your primary OS, I understand, go ahead and dual boot. For me though, it forced my to understand RHEL regarding it's strengths and limitations. It will help you get familiar with the GUI of RHEL and just desktop Linux in general. 

### A couple of things to consider:

**You won't have your DRM and codecs for watching things like Netflix from the RHEL Repos.** 

You will need to install a 3rd party repo like RPM Fusion: [rpmfusion](https://rpmfusion.org/). A great way to get all your codecs and DRM in one go is to install ffmpeg. (sudo yum install ffmpeg) There may be a few missing, but rpmfusion is pretty good about pointing you in the right direction.

**Things like Spotify, Steam, Discord, Slack, any of those won't be in RHEL's Repos.** 

Some of them may be in RPM Fusion, but Flatpak is a great way to go in order to get popular software for desktop Linux. Visit [Flathub](https://flathub.org) and get it set up to start installing some of your day to day software.

## Build a Lab
I won't go into a terrible amount of detail here as I don't want to dive too deep into the weeds on how to use KVM and Virt Manage (these are what I used for my lab). If you are running RHEL 8 I was for your desktop OS, it is very straight forward to install and use Virt Manager. (sudo yum install virt-manager) 

This is a blog that explains that you can also use cockpit (web interface for RHEL) to install and manage your virtual machines! [Link to Cockpit](https://www.redhat.com/en/blog/managing-virtual-machines-rhel-8-web-console) (These are not exam topics, but great things to know to get familiar with virtualization)

There are other options such as VirtualBox or VMware. Pick your poison, you decide how building a lab works best for you!

## Study Time
As with all exams, it is worth putting time aside to study each day in order to keep the material fresh and keep moving on the material. It is hard to put aside time, but you can put aside at least 5 minutes per day, you will find you will get excited with the material and study longer. 

Another great way is to listen to the lessons on your commute to work. Take some time to study over your lunch break. You will want to make sure you always some time aside for labbing. There is no way to learn RHCSA by watching, you need to be doing it. 

## Schedule the Exam
We all get in the trap of putting things off and procrastinating. A great way to handle that is with a deadline. If you schedule the exam 3 - 6 months out, you will guarantee you want to study, otherwise you will be out the $400 you spent, or worse yet, go through the pain of rescheduling the exam. 

Tell your friends and family when you plan on taking it and they can hold you to it. Another great person to discuss this with would be your boss, as they will want to hold you to that goal. There is no issue moving the deadline if you are struggling, but the truth is that you will never be truly 100% ready for the exam.

# Important Tips For the Exam
These are some tips I have regarding the taking the exam itself. These are things I wish I would've knew before I started studying or taking the exam. There may be some technical items in here you may not understand now, but are worth reviewing when you think you are ready for the exam.

## Technical Tips
I need to be careful of NDA here, so I can't go into specific test questions, but I can give you some areas to focus on for the exam. This is by no means a comprehensive checklist of everything that you should focus on, but I found these notes incredibly useful for me to pass the exam. **(Feel free to revisit these later when you've completed a training course and are getting ready to take the exam)**

### 4 Most Important Topics (In my Opinion) You Need To Learn for the Exam 

**Warning: The first 2 items as part of these objectives are absolute requirements to pass the exam. If you do not know them, you will fail the first time like I did.**

Objective: **Operate running systems** 

*Interrupt the boot process in order to gain access to a system*

1. **Root Password Reset**

* Edit grub line and put **rd.break** at the end of the kernel line. This will put you into a shell 
* mount -o rw,remount /sysroot  chroot /sysroot
* passwd
* touch /.autorelabel
* exit
* mount -o ro,remount /sysroot
* logout or CTRL+D (I always had to reset the power on the VM to get it to reboot properly)

Objective: **Deploy, configure, and maintain systems**  

*Install and update software packages from Red Hat Network, a remote repository, or from the local file system*

2. **Creating Repos (along with networking to get to the repos)**

* Directory Location:  /etc/yum.repos.d/
* example file name (example.repo) (sample of file below)

```
name = example
baseurl = http://example.repo.com/BaseOS (or AppStream)
enabled = 1
gpgcheck = 0 (if you are not provided a gpg key)
```

3. **Storage**   

Objective: **Configure Local Storage**  

*Assign physical volumes to volume groups | Create and delete logical volumes | Add new partitions and logical volumes, and swap to a system non-destructively* 
* Know **LVM** (how to create and extend using extents, percentages, and raw size, among other things)
* Know how to create and manipulate partitions
* **Swap Partitions** - How to make one, how to mount persistently
* Use **partprobe** after creating partitions (I like using gdisk)

Objective: **Create and Configure File Systems**  

*Configure disk compression | Manage layered storage | Mount and unmount network file systems using NFS*
* Know **VDO** - just the basics, understand RHEL best practices, understand permanent mounting of VDO volumes
* How to Manage **VDO**
  * When you create a filesystem for **VDO**, DO NOT DISCARD BLOCKS WHILE MAKING IT
    * For XFS - `mkfs.xfs -K /dev/mapper/NAME`
    * OR
    * For EXT4 - `mkfs.ext4 -E nodiscard /dev/mapper/NAME`
* Memorize your **VDO** options for fstab
```
defaults,_netdev,x-systemd.requires=vdo.service
```
* Know commands to make file systems
  * Know **NFS** - How to mount permanently with proper mount options
    * How to mount a **NFS** share automatically
    * `192.168.1.2:/data  /data  nfs  _netdev  0 0`
* Know **AutoFS** - understand the value of NFS and AutoFS combined for home directories, as well as other uses for it (Sanders has a great video on this)
* Know **Samba** - Basics of how to mount a share permanently
  * How to mount a **Samba** share automatically
  ```
  //192.168.1.2/data    /data   cifs    _netdev,username=blah,password=blah OR noauto (this will make sure it doesn't mount by default) 0 0
  ``` 

Objective: **Operate Running Systems** 

*Start, stop, and check the status of network services*

4. **ALWAYS ENABLE YOUR SERVICES SO THEY SURVIVE A REBOOT!** 
```
systemctl enable --now service.service
```

### Other Useful Technical Tips

Objective: **Understand and Use Essential Tools** 

*Access a shell prompt and issue commands with correct syntax | Locate, read, and use system documentation including man, info, and files in /usr/share/doc | List, set, and change standard ugo/rwx permissions* 

**Bash Completion**
* Install **bash-completion** RIGHT AWAY as soon as you can taking the exam. This will allow tab completion on commands. **(after configuring your repos and networking)**

**MAN**
```
man -k : searches descriptions of man pages
man -K : searches through all indexable man pages for your key word
```

**ACLs**
* Understand them and how they interact with UGO permissions


Objective: **Create and Configure File Systems** 

*Create and configure set-GID directories for collaboration* 

**SGID (Set Group ID Bit)** - sets up folder so when creating files it sets that group on the created file
```
chmod g+s folder
Octal 2 in the 1st position ![](usually 0 by default)
example : 2764
GID bit, rwx for owner, rw for group, read for other
```

**STICKY BIT** means only owners of the file created can delete the file ![](Except the owner of the directory, they can still delete the files)
```
chmod o+t folder 
Octal 1
example : 1764
Sticky bit, rwx for owner, rw for group, read for other
```

Objective: **Operate Running Systems** 

*Locate and interpret system log files and journals*

**Logging**

* Understand how to use **journalctl** to find important troubleshooting information when things aren't working as expected

Objective: **Manage Security** 
*Diagnose and address routine SELinux policy violation | Set enforcing and permissive modes for SELinux **SELinux (everyone's favorite)***
* Understand how to use the **setroubleshoot** tools - They don't suck anymore, it gives helpful tips on what could be going wrong with SELinux
  * **sealert -a /var/log/audit/audit.log** : Gives you setroubleshoots recommendation* 
  * **setenforce 0** : disable temporarily to make sure SELinux is the issue ![](make sure to turn it back on with **setenforce 1**)

## Taking the Exam
* Get a good night sleep, eat a good breakfast, and go to the bathroom before the exam. These were hugely helpful and will assist you getting into the right mindset.
* Arrive 15 minutes early and meditate briefly before going into the exam. I have anxiety and this was hugely helpful to put me in the right state of mind for taking the exam.
* This may sound counter intuitive but, **DON'T WORRY SO HARD ABOUT NOT PASSING THE FIRST TIME.** This is a **hard** exam, things are going to catch you off guard, keep your cool (I did not the first round) You will pass it eventually and you will learn a lot from the first attempt.

# Conclusion
I hope I was able to help you out with working through studying for this exam. It is a good life experience and it will separate you from the other resumes in the IT Industry. 

Feel free to contact me through my contact page with any questions you have regarding the exam, I'm a fairly open book, I will answer what I can.

**Good Luck!**