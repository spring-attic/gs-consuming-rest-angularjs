<#assign project_id="gs-consuming-rest-angularjs">
This guide walks you through writing a simple AngularJS client that consumes a Spring MVC-based [RESTful web service][u-rest].

What you'll build
-----------------

You will build an AngularJS client that consumes a Spring-based RESTful web service.
Specifically, the client will consume the service created in [Building a RESTful Web Servce][gs-rest-service].

The AngularJS client will be accessed by opening the `index.html` file in your browser, and will consume the service accepting requests at:

    http://rest-service.guides.spring.io/greeting

The service will respond with a [JSON][u-json] representation of a greeting:

```json
{"id":1,"content":"Hello, World!"}
```

The AngularJS client will render the ID and content into the DOM.

What you'll need
----------------

 - About 15 minutes
 - A favorite text editor
 - A modern web browser
 - An internet connection

<a name="scratch"></a>
Create an AngularJS Controller
------------------------------

First, you will create the AngularJS controller module that will consume the REST service: 

    <@snippet path="public/hello.js" prefix="complete"/>

This controller module is represented as a simple JavaScript function that is given AngularJS's `$scope` and `$http` components.
It uses the `$http` component to consume the REST service at "/greeting".

If successful, it will assign the JSON returned back from the service to `$scope.greeting`, effectively setting a model object named "greeting".
By setting that model object, AngularJS can bind it to the application page's DOM, rendering it for the user to see.

Create the Application Page
---------------------------

Now that you have an AngularJS controller, you will create the HTML page that will load the controller into the user's web browser:

    <@snippet path="public/index.html" prefix="complete"/>

Note the following two script tags within the `head` section.

```html
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script src="hello.js"></script>
```

The first script tag lods the minified AngularJS library (angular.min.js) from a content delivery network (CDN) so that you don't have to download AngularJS and place it in your project.
It also loads the controller code (hello.js) from the application's path.

The AngularJS library enables several custom attributes for use with standard HTML tags.
In index.html, two such attributes are in play:

 * The `<html>` tag has the `ng-app` attribute to indicate that this page is an AngularJS application.
 * The `<div>` tag has the `ng-controller` attribute set to reference `Hello`, the controller module.

Also note the two `<p>` tags which use placeholders (identified by double-curly-braces).

```html
<p>The ID is {{greeting.id}}</p>
<p>The content is {{greeting.content}}</p>
```

The placeholders reference the `id` and `content` properties of the `greeting` model object which will be set upon successfully consuming the REST service.

<a name="run"></a>
Run the client
---------------

You can now run the app using the Spring Boot CLI (Command Line Interface). Spring Boot includes an embedded Tomcat server, which offers a simple approach to serving web content. See [Building an Application with Spring Boot][gs-spring-boot] for more information about installing and using the CLI.

```sh
$ spring run app.groovy
```

Once the app starts, open http://localhost:8080 in your browser, where you see:
![Model data retrieved from the REST service is rendered into the DOM.](images/hello.png)

The ID value will increment each time you refresh the page.

Summary
-------

Congratulations! You've just developed an AngularJS client that consumes a Spring-based RESTful web service.

[gs-rest-service]: /guides/gs/rest-service/
[gs-spring-boot]: /guides/gs/spring-boot/
[zip]: https://github.com/spring-guides/${project_id}/archive/master.zip
<@u_rest/>
<@u_json/>
<@u_git/>
