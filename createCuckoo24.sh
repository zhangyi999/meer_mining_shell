#!/bin/sh
curl -X POST \
  http://127.0.0.1:1234/ \
  -H 'authorization: Basic dGVzdDp0ZXN0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: fe4dabe5-ab9c-8040-0843-6429282b8f96' \
  -d '{
  "method":"miner_generate",
  "version":"2.0",
  "params":[1,1],
  "id":1
}'
