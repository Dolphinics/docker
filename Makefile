
all: ubuntu1404 ubuntu1604 ubuntu1610 ubuntu1704 centos5 centos6 centos7 debian7 debian8 debian9 opensuse13 opensuse42 opensusetumbleweed fedora

ubuntu1404: ubuntu1404_dis/Dockerfile
	docker build ubuntu1404_dis -t $(USER)/ubuntu_dis:14.04

ubuntu1604: ubuntu1604_dis/Dockerfile
	docker build ubuntu1604_dis -t $(USER)/ubuntu_dis:16.04

ubuntu1610: ubuntu1610_dis/Dockerfile
	docker build ubuntu1610_dis -t $(USER)/ubuntu_dis:16.10

ubuntu1704: ubuntu1704_dis/Dockerfile
	docker build ubuntu1704_dis -t $(USER)/ubuntu_dis:17.04

centos5: centos5_dis/Dockerfile
	docker build centos5_dis -t $(USER)/centos_dis:5

centos6: centos6_dis/Dockerfile
	docker build centos6_dis -t $(USER)/centos_dis:6

centos7: centos7_dis/Dockerfile
	docker build centos7_dis -t $(USER)/centos_dis:7

fedora: fedora_dis/Dockerfile
	docker build fedora_dis -t $(USER)/fedora_dis:latest

debian7: debian7_dis/Dockerfile
	docker build debian7_dis -t $(USER)/debian_dis:7

debian8: debian8_dis/Dockerfile
	docker build debian8_dis -t $(USER)/debian_dis:8

debian9: debian9_dis/Dockerfile
	docker build debian9_dis -t $(USER)/debian_dis:9

opensuse13: opensuse13_dis/Dockerfile
	docker build opensuse13_dis -t $(USER)/opensuse_dis:13.2

opensuse42: opensuse42_dis/Dockerfile
	docker build opensuse42_dis -t $(USER)/opensuse_dis:42.2

opensusetumbleweed: opensuse_tumbleweed_dis/Dockerfile
	docker build opensuse_tumbleweed_dis -t $(USER)/opensuse_dis:tumbleweed

deploy:
	docker push $(USER)/centos_dis:5
	docker push $(USER)/centos_dis:6
	docker push $(USER)/centos_dis:7
	docker push $(USER)/fedora_dis:latest
	docker push $(USER)/debian_dis:7
	docker push $(USER)/debian_dis:8
	docker push $(USER)/debian_dis:9
	docker push $(USER)/opensuse_dis:13.2
	docker push $(USER)/opensuse_dis:42.2
	docker push $(USER)/opensuse_dis:tumbleweed
	docker push $(USER)/ubuntu_dis:14.04
	docker push $(USER)/ubuntu_dis:16.04
	docker push $(USER)/ubuntu_dis:16.10
	docker push $(USER)/ubuntu_dis:17.04
