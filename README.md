<div id="top"></div>

<!-- HEADER -->
<br />
<div align="center">
    <img src="https://swaywm.org/logo.png" alt="Logo">
    <br />
    <br />
  </p>
</div>

# SwayWM Dotfiles

<!-- ABOUT -->
This repo is to serve as a backup to myself (or anyone interested) of my configurations for Sway running on top of Fedora Linux. 

### Built With

* [Fedora](https://getfedora.org/)
* [Sway](https://github.com/swaywm/sway)
* [Stow](https://www.gnu.org/software/stow/)

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

The script is intended to run on a fresh Fedora Linux installation. You can get that here: [getfedora.org](https://getfedora.org/)

### Installation

1. Clone the repo

2. Add yourself to sudoers

```bash
sudo nano /etc/sudoers
```
Uncomment: `%wheel ALL=(ALL) NOPASSWD: ALL`

Then, at end of file, for your username add: `yourusername ALL=(ALL) NOPASSWD: ALL`

3. DNF Config

[dnf.conf manual](https://man7.org/linux/man-pages/man5/dnf.conf.5.html)

```bash
sudo nano /etc/dnf/dnf.conf
```

Add the following lines:

`fastestmirror=True`

`max_parallel_downloads=20`

`defaultyes=True`

`keepcache=True`

4. Auto deploy

The `install.sh` script will take care of updating the system and installing programs. 

```bash
cd sway-dotfiles
```

```bash
chmod +x install.sh
```

```bash
./install.sh
```

5. Install desired themes, other software, and reboot.

<!-- USAGE EXAMPLES -->
## Usage

All of the keybinds are specified under `.config/sway/config`. Some keybinds that launch bash scripts will be missing due to my own privacy concerns, however, feel free to replace them with your own customizations. I may update this section later to detail out the most common shortcuts.

<!-- CONTRIBUTING -->
## Contributing

Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/MyGreatFeatureRequest`)
3. Commit your Changes (`git commit -m 'Add some features'`)
4. Push to the Branch (`git push origin feature/MyGreatFeatureRequest`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the GPLv3 License. See `LICENSE` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>