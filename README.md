# Yakscart

A demo shopping cart built with [Yaks](https://github.com/plexus/yaks)

```
gem install -g
export RUBYGEMS_GEMDEPS=-

cp .env.templ .env

rake db:migrate
rake db:load_demo_data
rackup
```

## License

MIT License (Expat License), see [LICENSE](./LICENSE)
