%titles RPI - Create Users
%author: xavki

# Raspberry : gestion des users


<br>
- name: deploy users
  hosts: all
  become: yes
  vars:
    users:
    - "xavki"
  tasks:
  - name: create group admin
    group:
      name: "admin"
      state: present    
  - name: create user accounts
    user:
      name: "{{ item }}"
      groups: "admin"
    with_items: "{{ users }}"
  - name: add authorized keys
    authorized_key:
      user: "{{ item }}"
      key: "{{ lookup('file', 'files/'+ item + '.key.pub') }}"
    with_items: "{{ users }}"
  - name: "Allow admin users to sudo without a password"
    lineinfile:
      dest: "/etc/sudoers"
      state: "present"
      regexp: "^%sudo"
      line: "%admin ALL=(ALL) NOPASSWD: ALL"

