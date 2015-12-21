alias dt="bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
alias docker-env="docker-machine env default"

# http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html
function docker-cleanup {
  docker rmi $(docker images | grep '^<none>' | awk '{print $3}')
}

# usage:
#   docker-use <machine-name>
function docker-use {
  eval "$(docker-machine env $1)"
  echo "Using docker machine '$1'."
}
