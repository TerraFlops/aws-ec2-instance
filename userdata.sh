Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/usr/bin/env bash
echo Creating Authorized SSH Keys File...
if [[ -d /home/ubuntu; ]]; then
  home="/home/ubuntu";
elif [[ -d /home/ec2-user; ]]; then
  home="/home/ec2-user";
else
  home="/root"
fi
path="${home}/.ssh/authorized_keys"
cat <<EOF > ${path}
${authorized_keys}
EOF
cat ${path}
${custom_user_data}
--//

