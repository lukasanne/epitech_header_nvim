# Epitech Header.nvim

**Epitech Header.nvim** is a lightweight Neovim plugin for generating Epitech-style header in yours files. This plugin ensures compliance with Epitech's coding standards while being simple and easy to use.

---

## 🚀 Features

- Automatically generate Epitech-style headers for your files.
- Compatible with multiple programming languages.
- Customizable to include your name, project, and file descriptions.

---

## 🌐 Supported Languages

The plugin currently supports the following programming languages:

- **C**
- **C++**
- **Python**
- **Lua**
- **Makefile**
- **Haskell**

Feel free to request or contribute support for additional languages!

---

## 📦 Installation

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'lukasanne/epitech_header_nvim',
    config = function()
        require('epitech_header').setup {
            -- Add your configuration here
        }
    end
}
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    'lukasanne/epitech_header_nvim',
    config = function()
        require('epitech_header').setup {
            -- Add your configuration here
        }
    end
}
```

## 🛠️ Usage

Once the plugin is installed and configured, you can insert a header by running:

```vim
:EpitechHeader
```

### Exemple

When executed, the header will look something like this:

```c
/* 
** EPITECH PROJECT, [YYYY]
** [Project Name]
** File Description:
** [Your Description]
*/
```

## 🤝 Contributing
Contributions are welcome! If you have ideas or improvements, feel free to fork the repository and open a pull request. You can also file issues for bugs or feature requests.

<a href="https://github.com/lukasanne/epitech_header_nvim/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=lukasanne/epitech_header_nvim" />
</a>

