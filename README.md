# dotfiles - personal

> This repo is intended to store my configurations for things such as i3, tmux
> and neovim

## Installing packages

To install packages needed for my personal i3 setup for fedora run the
following command:

```bash
./main.sh
```

> NOTE:
> you'll have to follow the following sections below to ensure everything
> works correctly

## Bashrc

To use the custom Aliases file please add the following into you `.bashrc` file:

```shell
# --- Add aliases to bashrc ---
if [ -f ~/.config/aliases/index ]; then
    . ~/.config/aliases/index
fi
```

## Slock

If you want to update the slock configurations you will need to clone the repo
here is the command to do so:

```shell
git clone https://git.suckless.org/slock
```

Once install you can update the `config.def.h` file you can change the colours here:

```shell
static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#282828",   /* during input */
	[FAILED] = "#1d2021",   /* wrong password */
};
```

Afterwards you will need to compile the slock program and replace the old one:

```shell
sudo make clean install
```

Note I also needed to run the following to get `slock` to work:

```shell
sudo groupadd nogroup
```

## Proton mail setup

Go to the following site [proton mail app](https://protonapps.com/) and
download the linux app for proton mail, make you pick Linux (RPM) for Fedora.

Now you have got the RPM package run the following command on the package:

```shell
sudo dnf install ./ProtonMail-desktop-beta.rpm
```

Once installed you have now proton mail on your machine.

## Keyboard notes (mode 65)

Commands to get via to work within Linux:

```
sudo chmod a+rw /dev/hidraw*
```

Once updated return the permissions back to what they were previously set to:

```
sudo chmod 600 /dev/hidraw*
```
