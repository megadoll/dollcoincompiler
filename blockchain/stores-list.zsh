#!/bin/zsh

stores-list_response-header (){
    X-Firefox-Spdy=h2
    access-control-allow-credentials=true
    access-control-allow-origin=https://api.forgingblock.io
    alt-svc=h3-27=":443"; ma=86400, h3-28=":443"; ma=86400, h3-29=":443"; ma=86400
    cf-cache-status=DYNAMIC
    cf-ray=64c5d370ec2a5532-ORD
    cf-request-id=09ef827a940000553227392000000001
    content-length=4096
    content-type=application/json; charset=utf-8
    date=Sat, 08 May 2021 21:36:51 GMT
    expect-ct=max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
    nel={"report_to":"cf-nel","max_age":604800}
    report-to={"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report?s=ATmVdJ%2BYdsnaJJ7SlWDXHkpwc8qd5oyMDoOyvOBxCALbxjZi%2FnfFmkMwv6kQlqi21BnZ0SI5bVWvBK0PliJ%2Fz6AvbmjVOgpRaf9BQkQsgQYnNwVb"}],"group":"cf-nel","max_age":604800}
    server=cloudflare
}



stores-list_request-header () {
    Accept=text/html,application/xhtml+xml,application/xml;qimage/webp,*/*;q=0.8
    Accept-Encoding=gzip, deflate, br
    Accept-Lanaguage=es-CL,es;q=0.8,en-US;q=0.5,en;q=0.3
    Connection=Kep-alive
    Host=api.forgingblock.io
    Upgrade-Insecure-Requests=1
    User-Agent="$"
}