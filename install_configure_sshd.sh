#!/bin/bash -e

if grep -q '#AuthorizedKeysCommand none' /etc/ssh/sshd_config; then
  sed -i 's:#AuthorizedKeysCommand none:AuthorizedKeysCommand ${AUTHORIZED_KEYS_COMMAND_FILE}:g' /etc/ssh/sshd_config
else
  if ! grep -q "AuthorizedKeysCommand ${AUTHORIZED_KEYS_COMMAND_FILE}" /etc/ssh/sshd_config; then
    echo "AuthorizedKeysCommand ${AUTHORIZED_KEYS_COMMAND_FILE}" >> /etc/ssh/sshd_config
  fi
fi

if grep -q '#AuthorizedKeysCommandUser nobody' /etc/ssh/sshd_config; then
  sed -i "s:#AuthorizedKeysCommandUser nobody:AuthorizedKeysCommandUser nobody:g" /etc/ssh/sshd_config
else
  if ! grep -q 'AuthorizedKeysCommandUser nobody' /etc/ssh/sshd_config; then
    echo "AuthorizedKeysCommandUser nobody" >> /etc/ssh/sshd_config
  fi
fi
