function new_ticket {
    if [[ -z "$1" ]] ;then
        echo "new_ticket: No ticket number specified!";
        echo "usage: new_ticket [TICKET_NUM] [checkout]";
    else
        echo "git push origin master:ticket$1";
        git push origin master:ticket$1;
        if [[ -z "$2" ]] ;then
            git checkout ticket$1;
        fi
    fi
}

function got_ticket {
    if [[ -z "$1" ]] ;then
        echo "No ticket number specified!";
    else
        echo "git checkout ticket$1";
        count=$(git branch -a | grep ticket$1$ | wc -l)
        if [[ $count = 0 ]];then
            new_ticket $1
        else
            git checkout ticket$1;
        fi
    fi
}

function new_tag {

    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    branch=${ref#refs/heads/};

    if [ "$branch" != "master" ]; then
        echo "Not in master";
        echo "checkout master";
        git checkout master
    fi

    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    new_branch=${ref#refs/heads/};

    if [ "$new_branch" != "master" ]; then
        echo "Checkout master failed!";
        return;
    fi

    if [[ -z "$1" ]];then
        echo "No ticket number specified!";
    else
        echo "git tag -a before$1";
        git tag before$1 -m bofore$1;
        echo "git push origin before$1";
        git push origin before$1;
    fi
}

function to_date {
    if [[ -z "$1" ]] ;then
        echo "No unixtime specified!";
    else
        date -jf '%s' "$1" +"%Y-%m-%d %H:%M:%S"
    fi
}

function to_unix {
    date -j -f '%Y%m%d%H%M%S' "$1" +%s;
}

function towork {
    cd ~/work/$1
}
rb() { cd $HOME/work/$1; }
compctl -W $HOME/work/ -/ rb
