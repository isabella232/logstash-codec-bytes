# logstash-codec-bytes

Logstash filter plugin to chunk an input into parts of a specified number of bytes.

## Developing

### 1. Plugin Development and Testing

#### Code

- To get started, you'll need JRuby with the Bundler gem installed.

```sh
$ rvm install jruby
$ gem install bundler
```

- Install dependencies

```sh
$ bundle install
```

#### Test

- Update your dependencies

```sh
$ bundle install
```

- Run tests

```sh
$ bundle exec rspec
```

### 2. Running your unpublished Plugin in Logstash

#### 2.1 Run in a local Logstash clone

- Edit Logstash `Gemfile` and add the local plugin path, for example:

```ruby
gem "logstash-codec-bytes", :path => "/your/local/logstash-codec-bytes"
```

- Install plugin

```sh
bin/plugin install --no-verify
```

- Run Logstash with your plugin

```sh
bin/logstash -e 'input { file { delimiter => "" codec => bytes { length => X } } }'
```

At this point any modifications to the plugin code will be applied to this local Logstash setup. After modifying the plugin, simply rerun Logstash.

#### 2.2 Run in an installed Logstash

You can use the same **2.1** method to run your plugin in an installed Logstash by editing its `Gemfile` and pointing the `:path` to your local plugin development directory or you can build the gem and install it using:

- Build your plugin gem

```sh
gem build logstash-codec-bytes.gemspec
```

- Install the plugin from the Logstash home

```sh
bin/plugin install /your/local/plugin/logstash-codec-bytes.gem
```

- Start Logstash and proceed to test the plugin
