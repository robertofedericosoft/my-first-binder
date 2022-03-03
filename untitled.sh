#!/bin/bash
echo "loading openapi file"

#curl -X GET "http://127.0.0.1:8000/items/" -H "X-Token:me" -H "X-Token:you"
curl -X GET "http://127.0.0.1:8000/openapi.json" > output.json
<<comm
echo "get 1 "
curl -X GET "http://127.0.0.1:8000/items/baz/name"
echo
echo "get public"
curl -X GET "http://127.0.0.1:8000/items/baz/public"

echo "put 1"
curl -X PUT "http://127.0.0.1:8000/items/" -H "Content-Type: application/json" -d '
{
    "name": "Foo",
    "description": "The pretender",
    "price": 42.0,
    "tax": 3.2,
    "tags": [
        "rock",
        "metal",
        "bar"
    ]
}'
comm
curl -X POST "http://127.0.0.1:8000/user/" -H "Content-Type: application/json" -d '
{
    "username": "Foo",
    "password": "********",
    "email":"pippo@example.com", 
    "full_name": "roberto Federico"
}'

<<comm
curl -X PUT "http://127.0.0.1:8000/items/foo" -H "Content-Type: application/json"
comm
