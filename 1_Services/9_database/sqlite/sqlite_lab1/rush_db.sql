BEGIN TRANSACTION;
CREATE TABLE rush 
                (id INTEGER PRIMARY KEY AUTOINCREMENT, 
                name TEXT NOT NULL,
                description TEXT,
                type TEXT,
                tag TEXT,
                initial_duration TEXT,
                level TEXT,
                start_time TEXT,
                end_time TEXT,
                real_duration TEXT,
                achieved BOOLEAN DEFAULT False NOT NULL,
                markdown_path TEXT
                );
INSERT INTO rush VALUES(1,'Docker - Back to basics ','Re-learning docker basic component','Learning','system','3 hours','easy','2021-01-05 20:30:08.784078','2021-01-05 23:35:30.672048','3:05:21.887970',1,'');
INSERT INTO rush VALUES(2,'Docker - Back to basics part 2','Re-learning docker basic component','Learning','system','3 hours','easy','2022-10-24 15:07:42.624525','2022-10-24 18:07:46.601335','3:00:03.976810',1,'');
INSERT INTO rush VALUES(3,'Docker - POC docker rootless installation ',' Docker installation in rootless mode based on official documentation (https://docs.docker.com/engine/security/rootless) and best practice (https://docs.docker.com/engine/security/)','POC','system','3 hours','easy','2022-10-29 12:12:42.000374','2022-10-29 15:07:46.601335','2:55:04.600961',1,'6_Virtualization/docker/docker_lab2/docker_lab2.md');
INSERT INTO rush VALUES(4,'Docker - POC docker remote host configuration ','Configure docker to be used as remote host with SSL secure (not simple TCP)','POC','system','3 hours','easy','2022-10-30 08:40:25.624056','2022-10-30 11:45:38.446783','3:05:12.822727',1,'');
INSERT INTO rush VALUES(5,'squid - discovering','Create a squid proxy in podman for http logging ','POC','system','3 hours','easy','2021-06-08 22:30:03.563756','2021-06-09 00:04:34.346755','1:34:30.782999',1,'1_Services/1_aaa/squid/squid_lab1/squid_lab1.md');
INSERT INTO rush VALUES(6,'nginx - discovering','Start a nginx container with podman','POC','system','3 hours','easy','2021-08-15 20:15:33.305756','2021-08-15 20:45:14.569055','0:29:41.263299',1,'2_webserver/nginx/nginx_lab1/nginx_lab1.md');
INSERT INTO rush VALUES(7,'restic - discovering','First steps with restic backup tools','POC','system','3 hours','easy','2021-08-16 22:00:23.103981','2021-08-17 00:30:44.567305','2:30:21.463324',1,'3_backup/restic/restic_lab1/restic_lab1.md');
INSERT INTO rush VALUES(8,'dhcpd in docker ','Install a simple dhcpd server in docker container for testing purpose','POC','system','3 hours','easy','2021-08-23 21:15:35.270756','2021-08-23 22:15:16.193055','0:59:40.922299',1,'4_dhcp/dhcpd/dhcpd_lab1/dhcpd_lab1.md');
INSERT INTO rush VALUES(9,'DNS - big lab','Create a ''overcomplicated'' DNS server in podman container with bind, cloudflared and pihole. Based on the tutorial from : https://sinister.io/articles/podman-dns/','POC','system','3 hours','easy','2021-09-15 20:30:08.904812','2021-09-15 23:06:29.346755','2:36:20.441943',1,'5_dns/bind/bind_lab1/bind_lab1.md');
INSERT INTO rush VALUES(10,'cockpit - discovering','Testing the tools cockpit','POC','system','3 hours','easy','2021-09-25 20:30:55.904812','2021-09-25 23:31:19.346755','3:00:23.441943',1,'1_Services/10_others/cockpit/cockpit.md');
INSERT INTO rush VALUES(11,'nexcloud - discovering','Testing nextcloud in container from tutorial : https://fedoramagazine.org/nextcloud-20-on-fedora-linux-with-podman/','POC','system','3 hours','easy','2021-10-20 19:00:15.273065','2021-10-20 22:00:15.273065','3:00:00',1,'1_Services/10_others/nextcloud/nextcloud_lab1/nextcloud_lab1.md');
INSERT INTO rush VALUES(12,'OpenProject - discovering','Testing OpenProject, an open source project management software. ','POC','system','3 hours','easy','2021-11-14 20:00:25.561406','2021-11-14 23:12:28.394120','3:12:02.832714',1,'1_Services/10_others/project_manager/openproject/openproject_lab1/openproject_lab1.md');
INSERT INTO rush VALUES(13,'Redmine - discovering','Testing redmine, an open source project management software. ','POC','system','3 hours','easy','2021-11-15 20:15:22.394551','2021-11-15 23:15:18.930388','2:59:56.535837',1,'1_Services/10_others/nextcloud/nextcloud_lab1/nextcloud_lab1.md');
INSERT INTO rush VALUES(14,'Jenkins - first lab','Create CI/CD plateform based on Gogs (gitwith web interface + Postgresql), Jenkins and Docker and testing it with a node.js simple app.','POC','system','3 hours','easy','2022-01-22 13:20:18.394551','2022-01-22 16:20:47.327304','3:00:28.932753',1,'2_CICD/jenkins/jenkins_lab1/jenkins_lab1.md');
INSERT INTO rush VALUES(15,'Podman - first lab ','Test podman and compare with docker (rootless container, rights, namespace, port, etc ...)','POC','system','3 hours','easy','2022-02-05 08:00:17.341003','2022-02-05 11:15:15.203827','3:14:57.862824',1,'6_Virtualization/podman/podman_lab1/podman_lab1.md');
INSERT INTO rush VALUES(16,'Locust - first test','Test Locust (load testing framework)','POC','system','3 hours','easy','2022-02-08 07:00:05.921443','2022-02-08 08:30:52.213004','1:30:46.291561',1,'7_Testing/webserver/locust/locust_lab1/locust_lab1.md');
INSERT INTO rush VALUES(17,'Iptables - part 1','Review the basics of iptables','Learning','network','3 hours','easy','2022-02-09 20:00:13.245133','2022-02-09 23:00:03.294778','2:59:50.049645',1,'8_CyberSecurity/1_firewall/iptables/iptables_lab1/iptable_lab1.md');
INSERT INTO rush VALUES(18,'Cybersec - container','Testing challenge ''Hacking Docker Remotely'' from : https://hackarandas.com/blog/2020/03/17/hacking-docker-remotely/','POC','system','3 hours','easy','2022-02-10 18:00:05.212446','2022-02-10 21:00:08.335981','3:00:03.123535',1,'8_CyberSecurity/2_container/container_lab1/container_lab1.md');
INSERT INTO rush VALUES(19,'Cybersec - ssh hack','Pentest on a test server wich host SSH server on port 22. Trying to break into a container through ssh with different tools and multiple approach','POC','system','3 hours','easy','2022-02-11 15:00:12.394221','2022-02-11 17:30:08.083443','2:29:55.689222',1,'8_CyberSecurity/3_services_hack/SSH/ssh_lab1/ssh_lab1.md');
INSERT INTO rush VALUES(20,'Cybersec - maltrail','Testing maltrail, a network malicous traffic analyzer : https://github.com/stamparm/maltrail','POC','system','3 hours','easy','2022-02-11 20:00:02.223650','2022-02-11 22:00:45.149244','2:00:42.925594',1,'8_CyberSecurity/4_ids_and_ips/maltrail/maltrail_lab_1/maltrail_lab1.md');
INSERT INTO rush VALUES(21,'Cybersec - nikto','Testing nikto (web server vulnerability scanner) tool using docker / podman container','POC','system','3 hours','easy','2022-02-12 20:00:38.082331','2022-02-12 21:00:25.671903','0:59:47.589572',1,'8_CyberSecurity/4_ids_and_ips/nikto/nikto_lab1/nikto_lab1.md');
INSERT INTO rush VALUES(22,'Cybersec - snort','Testing snort from podman/docker container','POC','system','3 hours','easy','2022-02-20 19:10:24.130200','2022-02-20 21:35:31.183296','2:25:07.053096',1,'8_CyberSecurity/4_ids_and_ips/snort/snort_lab1/snort_lab1.md');
INSERT INTO rush VALUES(23,'Cybersec - nettacker','Testing nettacker (vulnerabilty scanner) tools (from OWASP) from a podman/docker container','POC','system','3 hours','easy','2022-03-16 19:30:21.199371','2022-03-16 20:40:05.673113','1:09:44.473742',1,'7_vulnerability_scanning/nettacker_lab1/nettacker_lab1.md');
CREATE TABLE task 
                (id INTEGER PRIMARY KEY AUTOINCREMENT, 
                name TEXT,
                description TEXT,
                start_time TEXT,
                end_time TEXT,
                duration TEXT,
                final_duration TEXT,
                achieved BOOLEAN,
                rush INTEGER,
                FOREIGN KEY (rush) REFERENCES rush(id)
                );
INSERT INTO task VALUES(1,'Docker overview','Read the docker overview from official documentation (https://docs.docker.com/get-started/overview/)',NULL,NULL,'00:15:00','00:15:00',1,1);
INSERT INTO task VALUES(2,'What is a container','Watch presentation of Liz Rice (https://www.youtube.com/watch?v=8fi7uSYlOdc) to trully understand container ',NULL,NULL,'00:45:00','00:45:00',1,1);
INSERT INTO task VALUES(3,'linux filesystem','Get in deep with linux filesystem and get a fresh reminder on how they work (https://likegeeks.com/linux-file-system/)',NULL,NULL,'00:15:00','00:15:00',1,1);
INSERT INTO task VALUES(4,'docker rootless mode','How rootless mode work : (https://medium.com/@tonistiigi/experimenting-with-rootless-docker-416c9ad8c0d6)',NULL,NULL,'00:30:00','00:30:00',1,1);
INSERT INTO task VALUES(5,'docker vs lxc ',' docker vs lxc comparison : (https://earthly.dev/blog/lxc-vs-docker/)',NULL,NULL,'01:00:00','01:00:00',1,1);
INSERT INTO task VALUES(6,'syscall reminder ',' quick reminder on  how syscall works : (https://en.wikipedia.org/wiki/System_call)',NULL,NULL,'00:15:00','00:15:00',1,1);
INSERT INTO task VALUES(7,'user space','User space and usernamespace (https://en.wikipedia.org/wiki/User_space_and_kernel_space)',NULL,NULL,'00:15:00','00:15:00',1,2);
INSERT INTO task VALUES(8,'What is a container - video','re-Watch presentation of Liz Rice about cgroups TC-25:52 (https://www.youtube.com/watch?v=8fi7uSYlOdc) to trully understand container ',NULL,NULL,'00:05:00','00:05:00',1,2);
INSERT INTO task VALUES(9,'What is a container - article IBM','Read article from IBM lear hub (https://www.ibm.com/cloud/learn/containers)',NULL,NULL,'00:05:00','00:05:00',1,2);
INSERT INTO task VALUES(10,'cgroups','cgroups definition (https://en.wikipedia.org/wiki/Cgroups)',NULL,NULL,'00:10:00','00:10:00',1,2);
INSERT INTO task VALUES(11,'chroot',' chroot definition : (https://en.wikipedia.org/wiki/Chroot)',NULL,NULL,'00:05:00','00:05:00',1,2);
INSERT INTO task VALUES(12,'syscall reminder 2 ',' quick reminder on  how syscall works : (https://en.wikipedia.org/wiki/System_call)',NULL,NULL,'00:05:00','00:05:00',1,2);
INSERT INTO task VALUES(13,'interrupt / trap proc','trap processor instruction used to stop current executing code (https://en.wikipedia.org/wiki/Interrupt)',NULL,NULL,'00:15:00','00:15:00',1,2);
INSERT INTO task VALUES(14,'container vs virtual - atlassian','container vs virtual machine article : (https://www.atlassian.com/microservices/cloud-computing/containers-vs-vms#:~:text=The%20key%20differentiator%20between%20containers,above%20the%20operating%20system%20level.)',NULL,NULL,'00:15:00','00:15:00',1,2);
INSERT INTO task VALUES(15,'container vs virtual machine - red hat','container vs virtual machine article : (https://www.redhat.com/en/topics/containers/containers-vs-vms)',NULL,NULL,'00:15:00','00:15:00',1,2);
INSERT INTO task VALUES(16,'What is KVM - red hat','KVM definition : (https://www.redhat.com/en/topics/virtualization/what-is-KVM)',NULL,NULL,'00:15:00','00:15:00',1,2);
INSERT INTO task VALUES(17,'Kernel definition','kernel definition : (https://en.wikipedia.org/wiki/Kernel_(operating_system))',NULL,NULL,'00:05:00','00:05:00',1,2);
INSERT INTO task VALUES(18,'IPC definition','Inter process communication definition : (https://en.wikipedia.org/wiki/Inter-process_communication)',NULL,NULL,'00:05:00','00:05:00',1,2);
INSERT INTO task VALUES(19,'Docker Best practices','Get basic docker best practices from the video : (https://www.youtube.com/watch?v=8vXoMqWgbQQ)',NULL,NULL,'00:20:00','00:20:00',1,2);
INSERT INTO task VALUES(20,'docker doc rootless','See docker official doc to understand how to configure docker in rootless mode (https://docs.docker.com/engine/security/rootless)',NULL,NULL,'00:30:00','00:30:00',1,3);
INSERT INTO task VALUES(21,'docker security best practice','See docker official doc to understand how to secure docker (https://docs.docker.com/engine/security/)',NULL,NULL,'01:00:00','01:00:00',1,3);
INSERT INTO task VALUES(22,'docker rootless demo','Try the demo of docker rootless mode for better understanding (https://github.com/dkapanidis/docker-rootless)',NULL,NULL,'00:30:00','00:30:00',1,3);
INSERT INTO task VALUES(23,'Ansible playbook docker rootless','See Ansible playbook to install rootless docker (https://github.com/konstruktoid/ansible-role-docker-rootless)',NULL,NULL,'01:00:00','01:00:00',1,3);
INSERT INTO task VALUES(24,'Configure remote host','Configure docker daemon to bind IP address instead of unix socket, tutorial : (https://www.howtogeek.com/devops/how-and-why-to-use-a-remote-docker-host/)',NULL,NULL,'00:15:00','00:15:00',1,4);
INSERT INTO task VALUES(25,'Configure Client','Configure Client to use remote host (with context)',NULL,NULL,'00:30:00','00:30:00',1,4);
INSERT INTO task VALUES(26,'Create dockerfile','Create the squid dockerfile from the official image',NULL,NULL,'01:00:00','01:00:00',1,5);
INSERT INTO task VALUES(27,'Testing it','Test the image and view the squid logs',NULL,NULL,'00:30:00','00:30:00',1,5);
INSERT INTO task VALUES(28,'Start nginx container','Start nginx service with podman container, following tutorial : https://unixcop.com/5-step-nginx-contains-podman-easy/',NULL,NULL,'00:30:00','00:30:00',1,6);
INSERT INTO task VALUES(29,'Install restic backup server','Following the tutorial : https://adamtheautomator.com/restic-backup/',NULL,NULL,'00:30:00','00:30:00',1,7);
INSERT INTO task VALUES(30,'Read restic documentation','Learn more on restic from the official documentation : https://restic.readthedocs.io/en/latest/',NULL,NULL,'01:00:00','01:00:00',1,7);
INSERT INTO task VALUES(31,'Restic ansible playbook','Create an ansible playbook to install restic server and configure clients : https://github.com/donat-b/ansible-restic',NULL,NULL,'01:00:00','01:00:00',1,7);
INSERT INTO task VALUES(32,'Create dhcp container','Following gist : https://gist.github.com/mikejoh/04978da4d52447ead7bdd045e878587d',NULL,NULL,'01:00:00','01:00:00',1,8);
INSERT INTO task VALUES(33,'Create dockerfile','Create the dockerfile for bind9 and cloudflared',NULL,NULL,'01:00:00','01:00:00',1,9);
INSERT INTO task VALUES(34,'Configure bind9 container','Configure bind9 container to run in podman : https://medium.com/nagoya-foundation/running-a-dns-server-in-docker-61cc2003e899',NULL,NULL,'00:30:00','00:30:00',1,9);
INSERT INTO task VALUES(35,'Configure pihole','configure pihole container',NULL,NULL,'00:30:00','00:30:00',1,9);
INSERT INTO task VALUES(36,'Configure cloudlared for DOH','configure cloudlared container',NULL,NULL,'00:30:00','00:30:00',1,9);
INSERT INTO task VALUES(37,'Install cockpit server','Following the tutorial : https://www.tutorialworks.com/podman-monitoring-cockpit-fedora/',NULL,NULL,'01:00:00','01:00:00',1,10);
INSERT INTO task VALUES(38,'Read more about cockpit','Learn more on cockpit from the documentation : https://opensource.com/article/20/11/cockpit-server-management',NULL,NULL,'01:00:00','01:00:00',1,10);
INSERT INTO task VALUES(39,'install plugin for podman','installing a plugin for managing podman container : https://docs.oracle.com/en/operating-systems/oracle-linux/cockpit/cockpit-podman.html#managing-podman-containers',NULL,NULL,'01:00:00','01:00:00',1,10);
INSERT INTO task VALUES(40,'Install and configure mariaDb container','Configure volumes, pod ...',NULL,NULL,'01:00:00','01:00:00',1,11);
INSERT INTO task VALUES(41,'install and configure nginx container','create nginx config, volumes, add it to pod',NULL,NULL,'01:00:00','01:00:00',1,11);
INSERT INTO task VALUES(42,'install and configure redis container','install redis as cache database for nextcloud',NULL,NULL,'01:00:00','01:00:00',1,11);
INSERT INTO task VALUES(43,'Install and configure docker/podman container','Following the documentation : https://www.openproject.org/docs/installation-and-operations/installation/docker/',NULL,NULL,'01:00:00','01:00:00',1,12);
INSERT INTO task VALUES(44,'Playing with the tool','Testing it with some dummy project',NULL,NULL,'02:00:00','02:00:00',1,12);
INSERT INTO task VALUES(45,'Install and configure postgres container','Install and configure database for redmine with container (docker/podman), following : https://hub.docker.com/_/postgres ',NULL,NULL,'00:30:00','00:30:00',1,13);
INSERT INTO task VALUES(46,'Install and configure redmine container','Install and configure redmin with container (docker/podman), following : https://hub.docker.com/_/redmine/',NULL,NULL,'00:30:00','00:30:00',1,13);
INSERT INTO task VALUES(47,'adding redmine theme','attach to redmine container and add a new theme from : https://github.com/farend/redmine_theme_farend_bleuclair/releases',NULL,NULL,'00:30:00','00:30:00',1,13);
INSERT INTO task VALUES(48,'Playing with the tool','Testing it with some dummy project',NULL,NULL,'01:30:00','01:30:00',1,13);
INSERT INTO task VALUES(49,'Install and configure node hello-world app container','Create the ''hello-world'' app in node.js container',NULL,NULL,'00:15:00','00:15:00',1,14);
INSERT INTO task VALUES(50,'Install and configure Jenkins container','Install and configure jenkins container following : https://medium.com/@gustavo.guss/quick-tutorial-of-jenkins-b99d5f5889f2 ',NULL,NULL,'00:30:00','00:30:00',1,14);
INSERT INTO task VALUES(51,'Install and configure postrgeSQL container','Install and configure postrgeSQL for Gogs with container (docker/podman), following : https://hub.docker.com/_/postgres/ ',NULL,NULL,'00:30:00','00:30:00',1,14);
INSERT INTO task VALUES(52,'Install and configure postrgeSQL container','Install and configure Gogs (as git server) with container (docker/podman), following : https://www.jenx.si/2019/10/25/how-to-host-your-private-git-service-inside-docker/ ',NULL,NULL,'00:30:00','00:30:00',1,14);
INSERT INTO task VALUES(53,'Create CI/CD pipeline','Create a pipeline on jenkins to build the node.js app',NULL,NULL,'00:15:00','00:15:00',1,14);
INSERT INTO task VALUES(54,'Explore jenkins other features','Play with jenkins web interface',NULL,NULL,'01:00:00','01:00:00',1,14);
INSERT INTO task VALUES(55,'User ID in podman','Understanding the rootless process in podman with user id, following : https://blog.christophersmart.com/2021/01/26/user-ids-and-rootless-containers-with-podman/',NULL,NULL,'00:30:00','00:30:00',1,15);
INSERT INTO task VALUES(56,'rootless process in podman','Test the rootless features in lab, following : https://medium.com/techbull/what-is-user-namespace-and-podmans-rootless-containers-fc4c292c6bad',NULL,NULL,'00:45:00','00:45:00',1,15);
INSERT INTO task VALUES(57,'podman container''s port','Quick reminder on container''s port limitation in rootless ',NULL,NULL,'00:05:00','00:05:00',1,15);
INSERT INTO task VALUES(58,'podman UID, namespace','Quick reminder on UID and namespace in podman ',NULL,NULL,'00:10:00','00:10:00',1,15);
INSERT INTO task VALUES(59,'Play with podman','troubleshoot podman to get data on container (Rights, PID, namespace and roots authorization,  ports and networks,Stats (cpu, ram, ...), logs)',NULL,NULL,'01:30:00','01:30:00',1,15);
INSERT INTO task VALUES(60,'Testing Locust','Testing Locsut in very simple lab, following : https://www.it-connect.fr/serveur-web-tests-de-charge-en-python-avec-locust/',NULL,NULL,'01:30:00','01:30:00',1,16);
INSERT INTO task VALUES(61,'Read iptable tutorial','Read iptable tutorial : https://www.hostinger.com/tutorials/iptables-tutorial',NULL,NULL,'00:30:00','00:30:00',1,17);
INSERT INTO task VALUES(62,'Read firewall article ','Read firewall article on Frame ip : https://www.frameip.com/firewall/',NULL,NULL,'01:30:00','01:30:00',1,17);
INSERT INTO task VALUES(63,'Read firewall article ','How iptables works, following : https://www.digitalocean.com/community/tutorials/how-the-iptables-firewall-works',NULL,NULL,'01:00:00','01:00:00',1,17);
INSERT INTO task VALUES(64,'Configure the podamn remote host','Configure the podamn remote host, following : https://www.cloudassembler.com/post/remote-podman-service/',NULL,NULL,'00:45:00','00:45:00',1,18);
INSERT INTO task VALUES(65,'Configure the docker remote host','Configure the docker remote host, following : https://linuxhandbook.com/docker-remote-access/',NULL,NULL,'00:45:00','00:45:00',1,18);
INSERT INTO task VALUES(66,'Build a nmap scan container','build a nmap container to scan network (nmap help from : https://www.redhat.com/sysadmin/quick-nmap-inventory)',NULL,NULL,'00:45:00','00:45:00',1,18);
INSERT INTO task VALUES(67,'Launch attack on docker remote host','Attack Vector 1: SSH and Sudo Abuse, still from : https://linuxhandbook.com/docker-remote-access/',NULL,NULL,'00:45:00','00:45:00',1,18);
INSERT INTO task VALUES(68,'Create docker ssh server','Start the test docker ssh server',NULL,NULL,'00:30:00','00:30:00',1,19);
INSERT INTO task VALUES(69,'Create nmap container','Create nmap container',NULL,NULL,'00:15:00','00:15:00',1,19);
INSERT INTO task VALUES(70,'Attack SSH phase 1','Create a python script that execute bruteforce attack on dict, and launch it from docker container',NULL,NULL,'00:45:00','00:45:00',1,19);
INSERT INTO task VALUES(71,'Attack SSH phase 2','Launch ssh bruteforce attack with hydra, and launch it from docker container',NULL,NULL,'00:30:00','00:30:00',1,19);
INSERT INTO task VALUES(72,'Attack SSH phase 3','Pentest with CVE CVE-2018-10933 (based on libssh-scanner), and launch it from docker container',NULL,NULL,'00:30:00','00:30:00',1,19);
INSERT INTO task VALUES(73,'Install and configure maltrail container','Install and configure maltrail (docker/podman), following : https://github.com/johackim/docker-maltrail ',NULL,NULL,'00:30:00','00:30:00',1,20);
INSERT INTO task VALUES(74,'Playing with the tool','Generate malicous traffic and get result on maltrail web interface',NULL,NULL,'01:30:00','01:30:00',1,20);
INSERT INTO task VALUES(75,'Install and configure nikto container','Install and configure nikto (docker/podman), following : https://github.com/sullo/nikto ',NULL,NULL,'00:30:00','00:30:00',1,21);
INSERT INTO task VALUES(76,'Playing with the tool','Test it on a test webserver and get result',NULL,NULL,'00:30:00','00:30:00',1,21);
INSERT INTO task VALUES(77,'Install and configure snort container','Install and configure snort (docker/podman), following : https://github.com/John-Lin/docker-snort/',NULL,NULL,'01:30:00','01:30:00',1,22);
INSERT INTO task VALUES(78,'Test it with nmap','Test it with nmap scanning detection, following : https://frankfu.click/security/ids/how-to-detect-nmap-scan-using-snort/',NULL,NULL,'01:00:00','01:00:00',1,22);
INSERT INTO task VALUES(79,'Install and configure nettacker container','Install and configure nettacker (docker/podman), following : https://github.com/OWASP/Nettacker/wiki/Installation#docker',NULL,NULL,'00:30:00','00:30:00',1,23);
INSERT INTO task VALUES(80,'Play with the tools','test it on localhost',NULL,NULL,'00:30:00','00:30:00',1,23);
CREATE TABLE meeting 
                (id INTEGER PRIMARY KEY AUTOINCREMENT, 
                description TEXT,
                time TEXT,
                late BOOLEAN,
                catchup_lost_time BOOLEAN,
                catchup_lost_time_description TEXT,
                rush INTEGER,
                FOREIGN KEY (rush) REFERENCES rush(id)
                );
CREATE TABLE pause 
                (id INTEGER PRIMARY KEY AUTOINCREMENT, 
                reason TEXT,
                start_time TEXT,
                end_time TEXT,
                duration TEXT,
                rush INTEGER,
                FOREIGN KEY (rush) REFERENCES rush(id)
                );
INSERT INTO pause VALUES(1,'Drinking','2022-10-24 16:35:32.23779','2022-10-24 16:38:32.23779','0:03:00',2);
INSERT INTO pause VALUES(2,'Drinking','2022-10-24 17:16:32.156130','2022-10-24 17:18:32.156130','0:02:00',2);
INSERT INTO pause VALUES(3,'Drinking','2021-06-08 22:56:08.429503','2021-06-08 22:58:39.624789','0:02:31.195286',5);
INSERT INTO pause VALUES(4,'Drinking','2021-08-15 20:36:46.210342','2021-08-15 20:39:29.305928','0:02:43.095586',6);
INSERT INTO pause VALUES(5,'Drinking','2021-08-16 22:36:25.103981','2021-08-16 22:38:21.103981','0:01:56',7);
INSERT INTO pause VALUES(6,'Drinking','2021-08-23 21:50:25.130756','2021-08-23 21:52:40.159928','0:02:15.029172',8);
INSERT INTO pause VALUES(7,'Drinking','2021-09-15 22:15:08.904812','2021-09-15 22:18:08.904812','0:03:00',9);
INSERT INTO pause VALUES(8,'Drinking','2021-09-25 22:04:55.904812','2021-09-25 22:08:55.904812','0:04:00',10);
INSERT INTO pause VALUES(9,'Other reason','2021-10-20 20:00:15.273065','2021-10-20 20:15:15.273065','0:15:00',11);
CREATE TABLE aar 
                (id INTEGER PRIMARY KEY AUTOINCREMENT, 
                description TEXT,
                rush INTEGER,
                FOREIGN KEY (rush) REFERENCES rush(id)
                );
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('rush',23);
INSERT INTO sqlite_sequence VALUES('task',80);
INSERT INTO sqlite_sequence VALUES('pause',9);
COMMIT;
