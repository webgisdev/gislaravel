Why this project?
-----------------

Imporant notice: Following this [Tweet](https://twitter.com/taylorotwell/status/1620893768038719494) by Taylor Otwell (the creator of Laravel) and to avoid any confusion, I've decided to rename the project to Web GIS Project with Laravel and to change the domain name to [www.webgis.dev](https://www.webgis.dev). The Github repository (and username) has also changed and is now available at [https://github.com/webgisdev/gislaravel](https://github.com/webgisdev/gislaravel). Finally, the Twitter account is now @gislaravel. A redirection from the old domain name to the new one is in place and will be active for a few months.

Web GIS Project with Laravel is a learning/educational project covering and implementing most of the common Geographical Information Systems feature needs using PostGIS, GeoServer, OpenLayers, and Laravel through the design and development of a single Laravel project.

I'm building this project as an entire advanced course aimed at Laravel developers who want to get into the GIS world, screencasts (video courses) are now available for registered users. [Registration is free](https://www.webgis.dev/register), and I will never share your email address or send you any unsolicited messages. Also, Web GIS Project with Laravel is free of advertising and will never be monetized.

I will try to make one commit per article/lesson and reference it at the end of each post; the article will explain the details. You should be able to follow along on a Ubuntu development machine or on any platform running docker.

If you have any questions or comments, please create an account and post a comment on an article or follow @gislaravel on Twitter (with the button at the top of the page).

Web GIS Project with Laravel is an ongoing learning/educational project with all of the source code available on [Github](https://github.com/webgisdev/gislaravel) (please note that the original repository has changed).

Finally, an RSS feed for all articles/lessons is available at [https://www.webgis.dev/rss](https://www.webgis.dev/rss).

### About me and the stack

I've been working as a developer with commercial and open-source GIS software for more than 20 years. The Laravel framework is beautiful and elegant for backend development; the developer experience is impressive. So my goto Web/GIS backend stack is now:

*   [Laravel](https://laravel.com/)
*   [PostGIS](https://postgis.net/)
*   [Geoserver](http://geoserver.org/)

I'm more on the backend/DevOps than on the frontend for web development, so the frontend stack I use is a minimal one: Alpine.js. As stated by Caleb Porzio, its creator, "Alpine is a rugged, minimal tool for composing behavior directly in your markup ." Its syntax is very similar to Vuejs, so learning Alpine is a piece of cake if you are familiar with Vue.

Along with Alpine.js, I also heavily use Laravel Livewire, a Laravel package also created by Caleb Porzio. Livewire is like magic as it allows the creation of frontend reactive backend components in Laravel using its blade templating engine. Finally, the last piece of the frontend puzzle is OpenLayers, which is, in my opinion, the most advanced Javascript mapping library.

*   [Alpine.js](https://alpinejs.dev/)
*   [Laravel Livewire](https://laravel-livewire.com/)
*   [OpenLayers](https://openlayers.org/)

As a development stack, we will use docker (it is the only required dependency for the project)

*   [Docker](https://www.docker.com/)

Laravel offer a great [Docker](https://www.docker.com/) environment with [Laravel Sail](https://laravel.com/docs/9.x/sail), but we will try to work with docker directly to have complete control over the docker images we use. Docker might be intimidating initially, but it is really powerful and will allow us to have the perfect PHP/Laravel development environment with all of our dependencies running smoothly.
