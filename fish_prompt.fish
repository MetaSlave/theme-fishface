# name: FishFace

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l yellow (set_color -o f1fa8c)
  set -l red (set_color -o ff5555)

  if [ (_git_branch_name) ]
    echo -n -s "$yellow><(((\"> "
  else
    echo -n -s "$red><(((\"> "
  end
end
