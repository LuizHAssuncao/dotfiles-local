#sbin/sh

clone_from_projects() {
  workspace=$1
  shift
  github_user=$1
  shift
  projects=($@)

  cd $workspace

  echo "workspace: $workspace"
  echo "projects: $projects"
  echo "github_user: $github_user"

  for project in "${projects[@]}"
  do
    if [ -d "$workspace/$project" ]; then
      echo "Project $project already exists."
    else
      echo "cloning project $project."
      git clone "git@github.com:$github_user/$project.git"
    fi
  done
}

workspace=~/code/
personal_workspace="$workspace/personal"
work_workspace="$workspace/work"

mkdir -p $personal_workspace
mkdir -p $work_workspace

config_projects=(dotfiles prelude)
personal_projects=(programming-challenges presentations project_euler programming-languages)
work_projects=(core provisioning front middle-office ember-cli-bkf-core provisioning-dev qa-functional-specs docker-dev)

personal_github="LuizHAssuncao"
work_github="Creditas"

clone_from_projects $personal_workspace $personal_github $personal_projects
clone_from_projects $work_workspace $work_github $work_projects
clone_from_projects ~/ $personal_github $config_projects

ln ~/dotfiles/core/projections.json $work_workspace/core/.projections.json
mkdir -p ~/.vim/pythonx
ln ~/dotfiles/vim/pythonx/snippet_helpers.py ~/.vim/pythonx/snippet_helpers.py
cd ~/dotfiles/

#zsh plugins

