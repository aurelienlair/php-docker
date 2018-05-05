export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias to_json='python -m json.tool'
alias console='php bin/console'
alias phpunit='php vendor/bin/phpunit'
alias php-cs-fixer-update='php bin/php-cs-fixer.phar self-update'
alias php-cs-fixer-fix='php bin/php-cs-fixer.phar --verbose fix src/ && php bin/php-cs-fixer.phar --verbose fix tests'
alias sync_host_guest='rsync \
    -vrz \
    --progress \
    --include=src \
    --include=tests \
    --include=bin \
    --exclude=vendor \
    --exclude=.dockerignore \
    --exclude=.git \
    --exclude=Dockerfile \
    --exclude=README.md \
    --exclude=bash-tools.sh \
    --exclude=.vimrc \
    /usr/src/php-docker-src/ \
    /usr/src/php-docker'

alias sync_guest_host='rsync \
    -vrz \
    --progress \
    --include=src \
    --include=tests \
    --include=bin \
    --include=.php_cs.cache \
    --include=composer.json \
    --include=composer.lock \
    --include=phpunit.xml \
    --exclude=vendor \
    --exclude=bash-tools.sh \
    /usr/src/php-docker/ \
    /usr/src/php-docker-src'

function title()
{ 
    PS1="\[\e]0;$1\a\]\[\033[01;32m\]\u\[\033[01;34m\]::\[\033[01;31m\]\h \[\033[00;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\]-> \[\033[00m\]"
}

title
