# Vagabond Project

The Internauts:
Zachary Fong, Misha LeClair, Sera Pak, Michael Rogachevsky

## Objective

Build a Ruby on Rails App that allows users to read posts from others about travel tips to certain cities. Users can create, edit and delete their own tips. Our target user was a child, 8 - 12 years old, who can read and write but is still practicing those skills and learning to interact with online communities.

![Alt text](/app/assets/images/internauts_vagabond.png)

## Links

Live URL: https://vagabond-internauts.herokuapp.com/

GitHub Repository: https://github.com/sfnewzgirl/internauts-project-vagabond

Trello Link: https://trello.com/b/TMv205ro/vagabond-project

## Technologies Used
* Ruby on Rails, HTML, CSS, JavaScript
* MapBox API
* Gems - Skeleton, Paperclip, FFaker, BCrypt, AutoPrefixer-rails
* Heroku

## Code Examples

MapBox
Our client asked for a map on the splash page that users could visit each city by clicking on a pin. Our client encourages us to us the MapBox API.

First you include the map with a script tag and link in your views/application.html.erb. Then make a style tag for the position on the page of that view.
```
<style>
  body { margin:0; padding:0; }
  .map { position:absolute; top:20%; bottom:0; width:100%; }
</style>
```
MapBox allows you to create the map you want on their website then incorporate it into your project. Here is an example:
```
L.mapbox.accessToken = 'pk.eyJ1Ijoic2VyYWJha3BhayIsImEiOiJjaXR6ZXd6dXkwZG44Mm9xZXlqM2R6ZHRlIn0.H0yIaibh8nVisjcZ4FkAfQ';
var mapTooltips = L.mapbox.map('map-tooltips', 'serabakpak.1ji4ip2i')
  .setView([36, -5], 2);
var myLayer = L.mapbox.featureLayer().addTo(mapTooltips);

```
For pin drops, you create an array of geojson data. Here is an example of the Gibraltar pin drop.
```
var geojson = [
  {
    type: 'Feature',
    geometry: {
      type: 'Point',
      coordinates: [-5.3536, 36.1408]
    },
    properties: {
      title: 'Gibraltar',
      description: '<a href="http://localhost:3000/cities/3">Click me to see travel tips!</a>',
      'marker-color': '#ff3e3e',
      'marker-size': 'large',
      'marker-symbol': 'rocket'
    }
  ```

Nested Resources

![Alt text](/app/assets/images/london_screenshot.png)

One challenge was working with nested resources. Each ```post``` is a nested resource of a ```city``` as well as a ```user```. First we created the appropriate routes, Rails documentation helped here. For example, to create a new post you need the following routes:
```
get '/cities/:city_id/posts/new', to: 'posts#new', as: 'new_post'
post '/cities/:city_id/posts', to: 'posts#create'
```

Next the form view for a new post must link to both the city and post instance variables.
```
<%= form_for [@city, @post], url: "/cities/" + @city.id.to_s + "/posts", method: 'post' do |f| %>
```

Finally, the post controller must gather the information from the form and the instance of a user and city to completely create the post.
```
private
def post_params
  post_info = params.require(:post).permit(:title, :content)
  post_params = post_info.merge({city_id: params[:city_id], user_id: current_user.id, author: current_user.name})
end
```

## Merits & Badges
Our client wanted to integrate badges for the users, granting a badge at sign up, the creation of a first post to a city and when a user has written a post for all three cities.

The merit gem is popular and while well thought out it uses a complicated structure of sashes and badges but lacks the documentation is easily make this happen.
https://github.com/merit-gem/merit

We explored the activerecord-reputation-system gem as well that seems much simpler to integrate.
https://github.com/twitter/activerecord-reputation-system

We also talked through creating a badge system ourself with a join table of user_badges and a many-to-many relationships. This ultimately seemed the most logical and easy to integrate but we weren't able to implement due to time.
