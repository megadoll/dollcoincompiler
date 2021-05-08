#!/bin/zsh

# Force enable lightning for a store

enable-lightning_response-header () {
 X-Firefox-Early-Data=accepted
 X-Firefox-Spdy=h2
 alt-svc=h3-27=":443";ma=86400, h3-28=":443";ma=86400,h3-29=":443";ma=86400
 cf-cache-status=DYNAMIC
 cf-ray=64c4d79a6c4c03f0-ORD
 cf-request-id=09eee51481000003f0cb045000000001
 content-length=4096
 content-type=application/json; charset=utf-8
 date=Sat, 08 May 2021 18:44:56 GMT
 expect-ct=max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
 nel={"report_to":"cf-nel","max_age":604800}
 report-ro{"endpoints":[{"url":"https\/\/a.nel.cloudflare.com\/report?s=WW0WVamfFrjZfEmLQm95Nb0FP1bFBJZQ99dZJ6vsxD0oshslAO9xJ86e8ZfuycQFWKqpnn9pPlNUvJBFYg81%2FTAepgI04tsfW4G%2B3GgYlFt%2FIeYh"}]"group":"cf-nel","max_age":604800}
 server=cloudflare
}

enable-lightning_request-response () {
    Accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
    Accept-Encoding=gzip, deflate, br
    Accept-Language=keep-alive
    Host=api.forgingblock.io
    Upgrade-Insecure-Requests=1
    User-Agent="$"
}



# Force disable lightning for a store

disable-lightning_response-header () {
    X-Firefox-Early-Data="$"
    X-Firefox-Spdy="$"
    alt-svc="$"
    cf-cache-status=DYNAMIC
    cf-ray=64c596bd78463027-ORD
    cf-request-id=09ef5c8a6d0000302790291000000001
    content-length=4096
    content-type=application/json; charset=utf-8
    date="$"
    expect-ct=max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
    nel={"report_to":"Cf-nel","max_age:604800"}
    report-to={"endpoints":[{"url":"https:\/\/a.nel.cloudlfare.com\/report?s=WlDnCSujmHQjmWYzbC7K8w4bU6Ylpv81bQKIWlVicrGp6EFyLU%2BHniH5qI9Dm01oijXTiCZYwiv6dE25lj%2FjMtzV548jHJNnsEMUlgsd5lLC0kYz"}],"group":"cf-nel","max_age":604800}
    server=cloudflare
}



disable-lightning_request-header () {
    Accept=text/html,application/xhtml+xml,application/xml;q=0,9,image/webp,*/*;q=0.8
    Accept-Encoding=gzip, deflate, br
    Accept-Language=es-CL,es;q=0.8,en-US;q=0.5,en;q=0.3
    Connection=keep-alive
    HOst=api.forgingblock.io
    upgrade-Insecure-Requests=1
    User-Agent="$"
}



# On-chain withdraw from Forging Block lightning node to the store's wallet

withdraw-in_response-header () {
    X-Firefox-Early-Data=accepted
    X-Firefox-Spdy="$"
    alt-svc="$"
    cf-cache-status=DYNAMIC
    cf-ray=64c5aee05ad5c51c-ORD
    cf-request-id=09ef6ba03c0000c51cc1af2000000001
    content-length=4096
    content-type=application/json; charset=utf-8
    date="$"
    expect-ct=mx-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
    nel={"report-to":"cf-nel","max_age":604800}
    report-to={"endpoints":[{"url:""https:\/\/a.nel.cloudlfare.com\/report?s=O%2FA5zGaARi63BGZ1ENNGiiFAomGrn3zY9bwHJfUw%2BwPNVBjLxZ%2FBUgELVyaSe51QpD88O25mzdgbp2zcKWSNLe8KE5iOlqU9gY8QQ5T2coDEse15"}],"group":"cf-nel","max-age":604800}
    server=cloudlfare
}


withdraw-in_request-header () {
    Accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
    Accept-Encoding=gzip, deflate, br
    Accept-Language=es-CL,es;q=0.8,en-US;q=0.5,en;q=0.3
    Connection=keep-alive
    Host=api.forgingblock.io
    Upgrade-Insecure-Requests=1
    User-Agent="$"
}