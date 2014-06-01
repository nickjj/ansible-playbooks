## What is rails-basic?

It is a set of [ansible](http://www.ansible.com/home) roles to setup 1 or more servers to fulfill the needs of a pretty typical rails application.

## Dependencies

Ansible version 1.6+ must be installed to use this playbook.

`$ ansible-galaxy install nickjj.user nickjj.security nickjj.postgres nickjj.ruby nickjj.nodejs nickjj.nginx nickjj.rails nickjj.pumacorn nickjj.monit DavidWittman.redis`

If you get permission errors, run the command with `sudo`. If you get an errors saying you already have them then add `--force` to the end of the command.

## Roles used

If you are having issues running any tasks then please consult with the documentation for that specific role.

- `nickjj.user` https://github.com/nickjj/ansible-user
- `nickjj.security` https://github.com/nickjj/ansible-security
- `nickjj.postgres` https://github.com/nickjj/ansible-postgres
- `nickjj.ruby` https://github.com/nickjj/ansible-ruby
- `nickjj.rails` https://github.com/nickjj/ansible-rails
- `nickjj.pumacorn` https://github.com/nickjj/ansible-pumacorn
- `nickjj.monit` https://github.com/nickjj/ansible-monit
- `nickjj.nodejs` https://github.com/nickjj/ansible-nodejs
- `nickjj.nginx` https://github.com/nickjj/ansible-nginx
- `DavidWittman.redis` https://github.com/DavidWittman/ansible-redis

## Things you need to provide

You need to have a rails application hosted on github, bitbucket or some other remote git host. It can be a default rails application, however the app server you choose must write out a unix socket and also be puma or unicorn. You will also want to set the rails cache backend to be redis if you want to leverage the cache server group, but you can simply remove the cache server from the `site.yml` and `hosts` files if you want to use the rails default instead.

You can see what else you need to change in `group_vars/all.yml`.

## Running the playbook

After you have configured `group_vars/all.yml` then it is go time. You can run the playbook by making sure you are in the `rails-basic` folder and then entering this command into your terminal:

`$ ansible-playbook site.yml -i inventory/ -kK`

You only need to supply the `-kK` flags on the first run. These are short for telling ansible to prompt you for the user's password and the sudo password. Once you do this then ansible will kick in and provision the server to use ssh keys as long as everything is correct.

## Video tutorial

Not available right now.

## Having issues and are wondering what to do?

Make sure you check out the [general documentation](https://github.com/nickjj/ansible-playbooks#general-information-and-terminology). Please open a ticket if you find a bug.

## License

MIT