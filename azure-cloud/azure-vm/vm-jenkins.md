## Launch an Virtual machine(ubuntu) using Azure

### Install java
```
sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version
```
### Install and Configure Jenkins 

```
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```

#### To check the status of jenkins
```
sudo systemctl status jenkins 
```
#### Whenever the system starts jenkins start automatically
```
sudo systemctl enable jenkins
```

Take the public ip and port 8080 and paste in browser
if jenkins is not running in browser then open port 8080 in security group

Make sure ports are open `8080`

using this you will get the jenkins password
`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

**Login Successfull !!**
