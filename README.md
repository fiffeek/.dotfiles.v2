# Dotfiles managed by ansible

This is the second spin on the dotfiles automation with ansible.
Notable changes from [v1](https://github.com/fiffeek/.dotfiles) is the
application of the vertical slicing for the system components.
A system consists of a bunch of modules that can be composed of ansible roles
(e.g. files, links, systemd services) as opposed to horizontal slicing (an app has its own role).
This allows for using a [custom DSL](https://github.com/fiffeek/.dotfiles.v2/blob/main/ansible/playbooks/group_vars/framework/all.yaml)
to define the components, making each `module` (a bunch of ansible roles)
responsible for a self-sufficient part of the system (e.g. hyprland).

## Preview
https://github.com/user-attachments/assets/7efd851c-4e5d-4a37-b5aa-f39a3d0741ad

## Hardware
Some of the modules are tied specifically to the hardware the software runs on --
[Framework 13 with AMD 7840u](https://www.notebookcheck.net/Framework-Laptop-13-5-Ryzen-7-7840U-review-So-much-better-than-the-Intel-version.756613.0.html).
Two major things for the battery life enhancements were:
* replacing the default mediatek Wi-Fi card with [Intel AX210 non v-pro](https://frame.work/pl/en/products/intel-wi-fi-6e-ax210?v=FRANBWNT04)
* putting in the [120hz screen with VRR](https://universal-blue.discourse.group/t/vrr-on-framework-with-2-8k-screens/4677)

## Repo usage

```bash
# install asdf to pull python (pyenv) & setup venv
make install
# debug, no changes applied
make MODE=debug provisioning
# standard bootstrap, installs everything
make provisioning
# apply only one module
# bg is the tag on the module, corresponding to `base packages`
make MODE=debug ONLY_MODULE=bp provisioning
```

## Theming
Theming is done by piping [wallust](https://codeberg.org/explosion-mental/wallust) to [matugen](https://github.com/InioX/matugen),
the former being good at terminal coloring while the latter is much better
for UI elements, see [wallust templates](https://github.com/fiffeek/.dotfiles.v2/tree/main/ansible/files/framework/dots/wallust/templates)
and [matugen](https://github.com/fiffeek/.dotfiles.v2/tree/main/ansible/files/framework/dots/matugen/templates).

## Performance and power usage

### Power draw
The system is heavily tweaked for optimising power consumption (see the [power management script](https://github.com/fiffeek/.dotfiles.v2/blob/main/ansible/files/framework/bin/power/set-power-profile.sh) module), this applies specifically to the hardware of the laptop so might not be transferable.
With light usage (coding and browsing) pulls on average 8-10h of time on battery, idle is in the ballpark of 15h,
video playback ~6-8h.

| Task  | Draw  | Notes                            |
| ----- | ----- | -------------------------------- |
| idle  | 3.5W  | wifi on, bluetooth off, 60hz vrr |
| light | 4-8W  | firefox browsing, tmux + nvim, 60hz vrr |
| video | 7-10W | 720p 60fps ff video with hardware acc |

## Sceenshots
<img width="2880" height="2560" alt="ss_2025-08-23_00:30:34" src="https://github.com/user-attachments/assets/09361280-fae1-4737-ad5b-66cc23e7fdaa" />
<img width="2880" height="2560" alt="ss_2025-08-23_00:27:01" src="https://github.com/user-attachments/assets/f8da4abf-86b3-458d-b030-ab9979aa52af" />

## Related projects & credits
* [lots of useful patterns and scripts from theprimeagen's dev](https://github.com/ThePrimeagen/dev)
* [ansible dsl pattern from A's dotfiles](github.com/A/.dotfiles/tree/master)
* [folke's dots for widgets](https://github.com/folke/dot/tree/master/config)
* [JaKooLit's dots for rofi scripting and theming](https://github.com/JaKooLit/Hyprland-Dots/tree/main)
* [Matugen templates from Abhra00's Matuprland'](https://github.com/Abhra00/Matuprland)
* [Wallust templated from helixoid's dots](https://github.com/helixoid/hyprland-wallust)
