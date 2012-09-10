# capistrano-noty-core

capistrano-noty-core is the core of Capistrano notification framework.
Core connects various extensions (Capistrano Noty extensions) to Capistrano and 
create common entry point to send notifications.
It doesn't provide any useful for end user features, 
but extensions it integrates do.

## Installation

TODO: describe this section


## capistrano-noty configuration

TODO: describe this section


## Extensions' Usage

### Loading extension

TODO: describe this section


### Supported types of extension

There is several ways to extend Capistrano Noty.

* Notification Channel          (aka channel)
* Notification Message Template (aka template)
* Template's Data Source        (aka data_source)

Each of this extension types solve to one goal.
Notification channel sends messages. It receives rendered message template and
just send infromation to service, chat, email, etc.
So it could be a number of notification services integrated with different extensions.

Template renders messages embedding information retrieved from data sources.

And data sources retrieve information from local or remote system, 
source code repository, environment, deployed application, etc.


### Channels

TODO: describe this section


#### Known channel extensions


### Data Sources

TODO: describe this section


#### Known channel extensions


### Templates

TODO: describe this section


#### Known channel extensions


## Extensions' Development

### Extension anatomy

TODO: describe this section


## Extending core

Each extension should register itself in the core like this.

```ruby
Capistrano::Noty.register_extension

```

`register_extension` method accepts 3 arguments, but only one is obligatory.

* ''extension_name'' is a name which will be used for extension in the core. 
  It's optional. Depending on parameter configuration was assigned to the extension.
  In case of channel type extension this parameter define method 
  which could be called on capistrano plugin and subtask.
  So if your extension name is ''email''. You got `notify.email` plugin and
  `notify:email` task in your `config/deploy.rb`.
  For data source this is a name of infromation container inside templates.
  In case of ommitting extension name, default extension name will be used.
* ''extension_class'' is class object of your extension. It's olibatory.
  This class will be instantiated and configured with user defined options 
  inside the core. Should be subclass of `Capistrano::Noty::Extension`.
* ''core_instance'' to register extension in. This is optional argument.
  In case of advanced usage of Capistrano you may have several 
  `Capistrano::Configuration` instances and probably would like to have 
  different notification system on each. You are able to do that by creating
  several `Capistrano::Noty::Core` instances and configuring each with its own
  channels, data sources and even templates.
  By default ''capistrano-noty-core'' uses single Capistrano::Configuration
  instance and create default core instance to register extensions on it.


## Running tests:

* Run `rake spec`.


## Credits

* [Zeke Fast](https://github.com/zekefast)


## Copyright and License

Copyright (c) 2012 TMX Credit.

Released under MIT License. See the MIT-LICENSE file for more details.
