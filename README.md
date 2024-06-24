<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>The Movie DB App</title>
</head>
<body>

<h1>The Movie DB App</h1>

<p>This Flutter application allows users to search for TV shows and movies, view popular and trending categories, and enjoy a seamless experience with advanced features and optimizations.</p>

<h2>Features</h2>
<ul>
  <li><strong>Debounce for Search</strong>: Implements a debounce mechanism to prevent unnecessary API calls during search.</li>
  <li><strong>Platform Support</strong>: Compatible with both Web and Android platforms.</li>
  <li><strong>Unit Testing</strong>: Comprehensive unit tests using Mockito for mock data and interaction testing.</li>
  <li><strong>Smart Error Handling</strong>: Robust error handling to ensure the app runs smoothly.</li>
  <li><strong>Search Functionality</strong>: Users can search for TV shows and movies using The Movie Database (TMDB) API.</li>
  <li><strong>Loading Animations</strong>: Uses Shimmer animations to enhance the loading experience.</li>
  <li><strong>Modularization with Flutter Modular</strong>: The app is modularized for better code organization and maintainability.</li>
  <li><strong>Clean Architecture</strong>: Follows the principles of Clean Architecture for a scalable and maintainable codebase.</li>
  <li><strong>Category Switching</strong>: Users can switch between popular and trending categories seamlessly.</li>
  <li><strong>Responsive Design</strong>: The app is fully responsive, providing an optimal experience on any device.</li>
</ul>

<h2>Getting Started</h2>

<h3>Installation</h3>
<ol>
  <li>Clone the repository:
    <pre><code>git clone https://github.com/bxedy/themoviedb_app/
cd themoviedb_app</code></pre>
  </li>
  <li>Install dependencies:
    <pre><code>flutter pub get</code></pre>
  </li>
  <li>Run the application:
    <pre><code>flutter run</code></pre>
  </li>
</ol>

<h3>Running Tests</h3>
<p>To run unit tests:</p>
<pre><code>flutter test</code></pre>

<h2>Usage</h2>
<ul>
  <li><strong>Search</strong>: Use the search bar to look for TV shows and movies. The debounce feature ensures efficient querying.</li>
  <li><strong>Popular & Trending</strong>: Switch between popular and trending categories using the provided tabs.</li>
  <li><strong>Error Handling</strong>: If an error occurs, the app will handle it gracefully.</li>
</ul>

<h2>Screenshots</h2>
<img src="https://github.com/bxedy/themoviedb_app/assets/86973277/eb4dd772-c78f-490b-aca0-96a9c2a40f58.gif" width="31%">
<img src="https://github.com/bxedy/themoviedb_app/assets/86973277/6ce9cfaf-295b-49f1-9278-2bd8dac57c2c.gif" width="31%">

</html>
