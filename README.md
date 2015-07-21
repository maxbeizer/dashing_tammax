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

Check out http://shopify.github.com/dashing for more information.
