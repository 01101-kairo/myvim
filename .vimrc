execute pathogen#infect()
filetype plugin indent on 
syntax on
colorscheme onedark
if (has("termguicolors"))
        set termguicolors
endif
" ===[comandos que eu acho necessario já ser iniciado]==============================================================================
set cindent " indentação no estilo C
set is hls ic scs " opções de busca
set sm " mostra o início do bloco que acabou de ser fechado, sm é o mesmo que ShowMatch
" set wildmode=longest,list " para completar com TAB igualzinho o bash faz
set ai " auto indent
set shiftwidth=4 " se mudar o valor eu te mato :-P, numero de espaço usado quando rolar o autoindent
set softtabstop=4 " se mudar aqui, tb te mato! numero de espaços que deve-se dar quando apertar o TAB
set tabstop=4 " por favor, também nao mude isso! numero de espações que deve-se voltando quando apertar o backspace num tab
set bs=2 " para o backspace se comportar como a gente gosta
set fdm=marker " o modo como o folding deverá trabalhar, prometo escrever um artigo falando sobre o folding no vim
set termencoding=utf8 " Yeah!! UTF-8 em tudo!
set relativenumber " numero relativo (esses numeros mudando)
set nu! " só pra eu saber qual linha eu to 
" set eb " ná morauzinha eu ñ sei oq isso faz
set incsearch " isso aqui é pra pesquisa
set title " exibe alguma coisa na bara do terminal
" set laststatus=2 " parece q eu ñ precisso disso mas deixa ai
set t_Co=256 " real ñ sei pq isso mas eu gosto de me previnir com relação a cores
set nowrap " linha longa 
set encoding=utf8 " sou br é eu escrevo em portugues eu acho
set autoindent " aoutoindent
set wildmenu " menuzinho de completar comandos vim
set mouse=a " isso memo mouse no vim hooooo
set confirm " confirma exit 
set rtp+=~/.fzf " c sabe oq é isso .
" ===[NERDTree]=====================================================================================================================
" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" When open change the focus to the file (and not the NERDTree)
" autocmd! VimEnter * NERDTree | wincmd w
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ===[mapeamentos]=================================================================================================================
nmap <F2>  :tabnew  
nmap <F3>  :NERDTreeToggle <CR>
nmap <F4>  :w <CR>
nmap <F5>  :q <CR>
nmap <F6>  :set foldmethod=indent <CR>
nmap <F7>  :! javac "%" && java "%" <CR> 
nmap <F8>  :top ter <CR>
nmap <F12> :Goyo <CR>
" ===[comando de autocomplete ^x ^o]===============================================================================================
autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags " e o pior é q eu odeio xml
" plug pro python ^n ou ^p
if has("autocmd")
        autocmd FileType python set complete+=k/home/kairo/.vim/pydiction-0.5/pydiction isk+=.,(
endif " has("autocmd"
" ===[java]========================================================================================================================
" Java Support! Should go in compiler/ and ftplugin/
" furtei isso de outro vimrc e ñ sei como funciona
augroup javaSu
        autocmd!
        autocmd FileType java compiler javac
        au Filetype java setlocal makeprg=javac\ %\ -g
        au Filetype java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
        au FileType java noremap <buffer> <leader>8 :make<cr>:copen<cr>
        au FileType java noremap <buffer> <leader>9 :!echo %\|awk -F. '{print $1}'\|xargs java<cr>
augroup end

if executable('rg')
        set grepprg=rg\ --vimgrep
        set grepformat^=%f:%l:%c:%m
endif
" ===[as janelinhas ai em cima, joinha]============================================================================================
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" ==[let aparte]===================================================================================================================
let g:SuperTabDefaultCompletionType = "<c-n>"
let NERDTreeShowHidden=1
" ===[Gutentags]===================================================================================================================
" Não carregue-me se não há nenhum arquivo ctags
if !executable('ctags')
        let g:gutentags_dont_load = 1

endif
