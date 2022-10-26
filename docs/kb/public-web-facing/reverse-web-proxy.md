---
title: Reverse web proxy
outdated: true
---

# Reverse web proxy

go to `/etc/nginx/sites-available`

copy the 'default' file to the new reverse name, so status.breadnet.co.uk

Edit the file to reflect the name and address

```nginx
server {
      server_name <your domain>;
     add_header Strict-Transport-Security "max-age=15552000; includeSubDomains" always;

       location / {
       proxy_pass http://<ip address or hostname of server you want accessable>;
       proxy_next_upstream error  timeout invalid_header http_500 http_502 http_503;
       proxy_set_header Host $host;
       proxy_set_header X-Real-IP $remote_addr;
       proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
       proxy_set_header X-Forwarded-Proto https;
       proxy_redirect off;
       proxy_read_timeout 5m;
   }
client_max_body_size 10M;

    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/<domain>/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/<domain>/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = <domain>) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


      listen 80;
      listen [::]:80;
      server_name <domain>;
    return 404; # managed by Certbot


}
```

save it

create the symbolic link

```shell
sudo ln -s /etc/nginx/sites-available/name.breadnet.co.uk /etc/nginx/sites-enabled/name.breadnet.co.uk
```

Adding a cert

```shell
sudo certbot --nginx -d name.breadnet.co.uk
```