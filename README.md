<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Movie Listing App</title>
</head>
<body>

<h1>Movie Listing App</h1>

<p>This Flutter application allows users to search for TV shows and movies, view popular and trending categories, and enjoy a seamless experience with advanced features and optimizations.</p>

<h2>Features</h2>
<ul>
  <li><strong>Debounce for Search</strong>: Implements a debounce mechanism to prevent unnecessary API calls during search.</li>
  <li><strong>Platform Support</strong>: Compatible with both Web and Android platforms.</li>
  <li><strong>Unit Testing</strong>: Comprehensive unit tests using Mockito for mock data and interaction testing.</li>
  <li><strong>Smart Error Handling</strong>: Robust error handling to provide meaningful feedback to users.</li>
  <li><strong>Search Functionality</strong>: Users can search for TV shows and movies using The Movie Database (TMDB) API.</li>
  <li><strong>Loading Animations</strong>: Uses Shimmer animations to enhance the loading experience.</li>
  <li><strong>Modularization with Flutter Modular</strong>: The app is modularized for better code organization and maintainability.</li>
  <li><strong>Clean Architecture</strong>: Follows the principles of Clean Architecture for a scalable and maintainable codebase.</li>
  <li><strong>Category Switching</strong>: Users can switch between popular and trending categories seamlessly.</li>
</ul>

<h2>Getting Started</h2>

<h3>Prerequisites</h3>
<ul>
  <li>Flutter SDK</li>
  <li>Dart SDK</li>
</ul>

<h3>Installation</h3>
<ol>
  <li>Clone the repository:
    <pre><code>git clone https://github.com/yourusername/movielistingapp.git
cd movielistingapp</code></pre>
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

<h3>API Key</h3>
<p>The app uses The Movie Database (TMDB) API. You will need an API key to run the application. Replace the API key in the data source file with your own key.</p>

<h2>Usage</h2>
<ul>
  <li><strong>Search</strong>: Use the search bar to look for TV shows and movies. The debounce feature ensures efficient querying.</li>
  <li><strong>Popular & Trending</strong>: Switch between popular and trending categories using the provided tabs.</li>
  <li><strong>Error Handling</strong>: If an error occurs, the app will provide an appropriate message to the user.</li>
</ul>

</body>
</html>
