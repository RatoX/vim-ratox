# How to install

```
git submodule update --init --recursive
cp ~/.vimrc ~/.vimrc_bak "Save your old vim config
ln -fs $(pwd)/vimrc ~/.vimrc
vim +:PluginInstall +:qall
```
