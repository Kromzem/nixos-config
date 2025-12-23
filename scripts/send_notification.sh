API_KEY=$(< $1)
TITLE=$2
MESSAGE=$3

# Assume the Gotify docker container is runninh
curl -X POST -H 'Content-type: application/json' -H "Authorization: Bearer $API_KEY" --data "{\"message\":\"$MESSAGE\",\"title\":\"$TITLE\"}" http://127.0.0.1:1005/message

