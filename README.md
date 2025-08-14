# Dotfiles env managed by ansible

This is the second spin on the dotfiles automation with ansible.
Notable changes from [v1](https://github.com/fiffeek/.dotfiles) is the
application of the vertical slicing for the system components.
A system consists of a bunch of modules that can be composed of ansible roles
(e.g. files, links, systemd services) as opposed to horizontal slicing (an app has its own role).
This allows for using a [custom DSL](https://github.com/fiffeek/.dotfiles.v2/blob/main/ansible/playbooks/group_vars/framework/all.yaml)
to define the components, making each `module` (a bunch of ansible roles)
responsible for a self-sufficient part of the system (e.g. hyprland).

## Repo usage

```bash
# install asdf to pull python & setup venv
make install
# debug, no changes applied
make MODE=debug provisioning
# standard bootstrap, installs everything
make provisioning
# apply only one module
# bg is the tag on the module, corresponding to `base packages`
make MODE=debug ONLY_MODULE=bp provisioning
```

## Perf and power usage
TODO

## Related projects & credits

* [lots of useful patterns and scripts from theprimeagen's dev](https://github.com/ThePrimeagen/dev)
* [ansible dsl pattern from A's dotfiles](github.com/A/.dotfiles/tree/master)
* [folke's dots for widgets](https://github.com/folke/dot/tree/master/config)
