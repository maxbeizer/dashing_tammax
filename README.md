# Dashing Tammax

## Config

```
# .fitbit.yml
---
:oauth:
  :consumer_key:
  :consumer_secret:
  :token:
  :secret:
  :user_id:
```

```
FORECAST_IO_API_KEY
NEXT_BUS_API_KEY
AUTH_TOKEN
```

## Spin Up

```
bundle install
cp .env.dist .env
dashing start
open http://localhost:3030
```

## Docs

* NextBus docs: http://nextbus.jt2k.com/api

## Write to Spending Stats

`curl -d '{ "auth_token": "<<AUTH_TOKEN>>", "tamara": <<value>>, "max": <<value>> }' \http://localhost:3030/widgets/spending`

Check out http://shopify.github.com/dashing for more information.
