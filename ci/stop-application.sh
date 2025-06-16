set -e

docker_username=${docker_username:-sofusalbertsen}
APP_NAME=${APP_NAME:-kosli-tryout}

export docker_username
export APP_NAME

docker compose down