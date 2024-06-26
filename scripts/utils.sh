function tm() {
    tmux attach -t $1 || tmux new -s $1
}

alias sge='set_git_email'
function set_git_email() {
    remote=`git remote -v | awk '/\(push\)$/ {print $2}'`
    email=florobarotjr@gmail.com # default

    if [[ $remote == *github.com:thinkingmachines* ]]; then
        email=flo@thinkingmachin.es
    fi

    echo "Configuring user.email as $email"
    git config user.email $email
}

function fernet_key() {
    key=`python -c "exec(\"from cryptography.fernet import Fernet\\nprint(Fernet.generate_key().decode())\")"`
    echo $key | pbcopy
    echo "$key copied to clipboard!"
}

function get_bq_schema() {
    project=$1
    dataset=$2
    table=$3
    bq show --format=prettyjson "${project}:$dataset.$table" | jq ".schema.fields"
}

function get_bq_load_log() {
    job_id=$1
    bq --format=prettyjson show -j $job_id
}

function git() {
    if [[ "$(pwd)" == "/mnt/c/obsidian/notes" ]]; then
        git.exe "$@"
    else
        command git "$@"
    fi
}

