![License](https://img.shields.io/github/license/hamza-topo/fahhctl)
![Shell](https://img.shields.io/badge/shell-bash%20%7C%20zsh-blue)
![Stars](https://img.shields.io/github/stars/hamza-topo/fahhctl)
````markdown
# fahhctl 🔊

Play a dramatic **FAHH** sound when you type a command that doesn't exist.

Because terminal mistakes deserve sound effects.

Works with **zsh** and **bash**.

---

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/hamza-topo/fahhctl/main/install.sh | bash
````

Then reload your shell:

```bash
source ~/.zshrc
```

or just open a new terminal.

---

## Try it

```bash
asdasdasd
```

Expected result:

```
zsh: command not found: asdasdasd
*FAHH sound plays*
```

---

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/hamza-topo/fahhctl/main/uninstall.sh | bash
```

---

## Requirements

You need a player capable of playing mp3.

Recommended:

```bash
sudo apt install mpv
```

Also works with:

* ffplay
* mpg123
* paplay
* aplay

---

## Commands

```bash
fahhctl status
fahhctl enable
fahhctl disable
fahhctl play
```

---

## Custom sound

Replace the sound file:

```bash
~/.local/share/fahh/fahh.mp3
```

Example:

```bash
cp your-sound.mp3 ~/.local/share/fahh/fahh.mp3
```

---

## How it works

The installer adds a tiny hook to your shell config.

When a command doesn't exist, it runs:

```
fahhctl play
```

Your shell still prints the normal error message.

---

## Why `source ~/.zshrc`?

The installer edits your shell config, but your current terminal session doesn't reload automatically.

Opening a new terminal also works.

---

## Contributing

Ideas welcome.

* other shells
* better installer UX
* different trigger modes
* config file

---

## License

MIT

```

Play a FAHH sound when a command is not found.

````


---
