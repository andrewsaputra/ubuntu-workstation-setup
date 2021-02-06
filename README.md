## Description
This repository contains installation scripts to do initial setup for common softwares used in my development machine.

## How to Use

### Prerequisites
- successfully ran **sudo apt full-upgrade** to ensure all packages are latest
- public - private keys are generated properly
```
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N '' -C youremail@mailserver.com
```

### Installation
- install git if it’s not yet installed in your laptop : **sudo apt install git**
- clone this repository and run the relevant setup scripts based on your OS
```
# create a folder to host your cloned repositories
mkdir ~/repositories
cd ~/repositories

git clone git@github.com:andrewsaputra/ubuntu-workstation-setup.git

# navigate to relevant OS setup folder
cd ubuntu-workstation-setup/ubuntu-20

# run all installation scripts
./install-basic-dev-softwares.sh
./install-infra-management-softwares.sh
```
- reload terminal
- Setup basic aws configuration, Access Key ID and Secret Access Key can be left empty if auth are done with Google SSO.
```
$ aws configure
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]: ap-southeast-1
Default output format [None]: json
```
- Add SAML profile to **~/.aws/config**. Test by running successful **aws-google-auth -p saml** command.
```
[profile saml]
region = ap-southeast-1
output = json
google_config.role_arn = << role_arn >>
google_config.provider = << provider >>
google_config.google_idp_id = << google_idp_id >>
google_config.google_sp_id = << google_sp_id >>
google_config.google_username = << your_email >>
google_config.duration = 3600
google_config.ask_role = False
google_config.u2f_disabled = True
```

### Other Helpful Softwares
You can easily download these from their official websites or ubuntu software manager
- Intellij IDEA Community Edition : development IDE
- Atom / VSCode : Nice to have multipurpose text editor
- Authy : to manage 2FA
- LastPass : handy password manager / generator
- Postman : helpful software to manage api requests
- Robo 3T : simple MongoDB GUI
