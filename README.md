# Introduction

Koha’s Plugin System (available in Koha 3.12+) allows for you to add additional tools and reports to [Koha](http://koha-community.org) that are specific to your library. Plugins are installed by uploading KPZ ( Koha Plugin Zip ) packages. A KPZ file is just a zip file containing the perl files, template files, and any other files necessary to make the plugin work. Learn more about the Koha Plugin System in the [Koha 3.22 Manual](http://manual.koha-community.org/3.22/en/pluginsystem.html) or watch [Kyle’s tutorial video](http://bywatersolutions.com/2013/01/23/koha-plugin-system-coming-soon/).

# Downloading

From the [release page](https://github.com/bywatersolutions/koha-plugin-counters/releases) you can download the relevant *.kpz file

# Installing

Koha's Plugin System allows for you to add additional tools and reports to Koha that are specific to your library. Plugins are installed by uploading KPZ ( Koha Plugin Zip ) packages. A KPZ file is just a zip file containing the perl files, template files, and any other files necessary to make the plugin work.

The plugin system needs to be turned on by a system administrator.

To set up the Koha plugin system you must first make some changes to your install.

* Change `<enable_plugins>0<enable_plugins>` to `<enable_plugins>1</enable_plugins>` in your koha-conf.xml file
* Confirm that the path to `<pluginsdir>` exists, is correct, and is writable by the web server
* Restart your webserver

Once set up is complete you will need to alter your UseKohaPlugins system preference. On the Tools page you will see the Tools Plugins and on the Reports page you will see the Reports Plugins.

# Link the template

```
sudo ln -s /var/lib/koha/<instance>/plugins/Koha/Plugin/No/Libriotech/Counters/opac/script/counters.tt /usr/share/koha/opac/htdocs/opac-tmpl/bootstrap/en/modules/counters.tt
```

# Apache-config

```
ScriptAlias /counters.pl "/var/lib/koha/<instance>/plugins/Koha/Plugin/No/Libriotech/Counters/opac/script/counters.pl"
ScriptAlias /data.pl "/var/lib/koha/<instance>/plugins/Koha/Plugin/No/Libriotech/Counters/opac/script/data.pl"
Alias /counters "/var/lib/koha/<instance>/plugins/Koha/Plugin/No/Libriotech/Counters/opac/public/"
# The stanza below is needed for Apache 2.4+
<Directory /var/lib/koha/<instance>/plugins>
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>
```
