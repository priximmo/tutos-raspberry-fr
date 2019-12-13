- name: deploy users
  become: yes
  hosts: all
  roles:
  - users
  - firewalls
