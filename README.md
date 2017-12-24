Supported tags
----

* ```4.9.1-php7.1-apache-higher```
* ```4.9.1-php7.1-apache```
* ```4.9.0-php7.1-apache-higher```
* ```4.9.0-php7.1-apache```
* ```4.8.1-php7.1-apache```
* ```4.7-php5.6-apache```

Usage
----

```$ docker run --name some-wordpress --link some-mysql:mysql -d pedrogoncalvesk/wordpress```

You can use this image with custom runtime commands. Use the template below (apache2-custom file) and run the following commands:

### Example ```apache2-custom``` file:

~~~sh
#!/bin/sh
~~~

```set -e```
 
```## GET YOUR THEME HERE```
 
```echo "Theme installed!";```

```echo "Executing apache2-foreground";```
 
```# Force wp-content accessible for www-data user```

```chown -R www-data:www-data /var/www/html/wp-content```
 
```# Execute apache```

```exec "apache2-foreground"```

### Run custom

```$ docker run --name some-wordpress --link some-mysql:mysql -v /path/to/apache2-custom:/usr/local/bin/apache2-custom:ro -d pedrogoncalvesk/wordpress```

License
----

This repository is licensed under MIT License Copyright (c) 2017. See LICENSE for further details.

**Free Software, Hell Yeah!!**