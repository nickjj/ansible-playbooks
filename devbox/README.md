## What is devbox?

It is a set of [ansible](http://www.ansible.com/home) roles and tasks to setup a development box. I specifically use it on **Xubuntu 14.04** but it should be usable for most ubuntu distros

## Dependencies

You must install ansible on the development box first as it runs on localhost.

`$ ansible-galaxy install nickjj.postgres nickjj.ruby nickjj.nodejs nickjj.xampp gpstathis.elasticsearch DavidWittman.redis --force`

If you get permission errors, run the command with `sudo`.

## Roles used

If you are having issues running any tasks then please consult with the documentation for that specific role.

- `nickjj.postgres` https://github.com/nickjj/ansible-postgres
- `nickjj.ruby` https://github.com/nickjj/ansible-ruby
- `nickjj.nodejs` https://github.com/nickjj/ansible-nodejs
- `nickjj.xampp` https://github.com/nickjj/ansible-xampp
- `DavidWittman.redis` https://github.com/DavidWittman/ansible-redis
- `gpstathis.elasticsearch` https://github.com/Traackr/ansible-elasticsearch

## Very important notes

You should be warned that this playbook is set to run on localhost by default. Do not run this on your current devbox unless you want all of this to run on it! You should also comment out the `custom` role in `site.yml` or at least look through it before running it as it makes some pretty opinionated decisions.

## Running the `site` playbook

After you have configured `inventory/group_vars/all.yml` then it is go time. You can run the playbook by making sure you are in the `devbox` folder and then entering this command into your terminal:

`$ ansible-playbook site.yml -i inventory/ -kK`

## Running the `restore` playbook

The restore playbook expects you to have a `~/backup` directory on the devbox. It will then take that backup directory and recursively copy it into your home directory.

You would use this to restore your home directory. I personally use it to restore my ssh keys, .config folder and other personal files.

`$ ansible-playbook restore.yml -i inventory/ -kK`

## Video tutorial

Not available right now.

## Having issues and are wondering what to do?

Make sure you check out the [general documentation](https://github.com/nickjj/ansible-playbooks#general-information-and-terminology). Please open a ticket if you find a bug.

## License

MIT
