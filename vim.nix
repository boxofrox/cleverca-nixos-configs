{config,pkgs,...}:

let
  myVim = pkgs.vim_configurable.customize {
    name = "vim";
    vimrcConfig = {
      customRC = ''
        syntax on
        set nu
        set foldmethod=syntax
        set listchars=tab:->
        set list
        set backspace=indent,eol,start
        nmap <F3> :!ninja <enter>
        map <F7> :tabp<enter>
        map <F8> :tabn<enter>
        set expandtab
        set softtabstop=2
        set shiftwidth=2
        set autoindent
        call vundle#begin()
        Plugin 'wakatime/vim-wakatime'
        call vundle#end()
      '';
      vam.pluginDictionaries = [
        {
          names = [
            "vim-nix"
            #"youcompleteme" "Syntastic" "vundle"
          ];
        }
      ];
    };
  };
in
{
  environment.systemPackages = [ myVim ];
  environment.shellAliases.vi = "vim";
  environment.variables.EDITOR = "vim";
  programs.bash.shellAliases = {
    vi = "vim";
  };
}