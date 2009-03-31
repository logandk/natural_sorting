natural_sorting - Sort arrays in a more human way
=================================================

This is a Ruby on Rails plugin, which introduces a new method to the Array
class in order to sort values in a natural way.



Installation
============

As a Rails Plugin
-----------------

Use this to install as a plugin in a Ruby on Rails app:

	$ script/plugin install git://github.com/logandk/natural_sorting.git


As a Rails Plugin (using git submodules)
----------------------------------------

Use this if you prefer the idea of being able to easily switch between using edge or a tagged version:

	$ git submodule add git://github.com/logandk/natural_sorting.git vendor/plugins/natural_sorting



Usage
=====

The default *sort* method will sort your array like this:

	>> ["Image 1", "Image 3", "Image 11", "Image 20"].sort
	=> ["Image 1", "Image 11", "Image 20", "Image 3"]

This plugin introduces the *sort_natural* method, which sorts your array like this:

	>> ["Image 1", "Image 3", "Image 11", "Image 20"].sort_natural
	=> ["Image 1", "Image 3", "Image 11", "Image 20"]

Much better.


By default, the *sort_natural* method is not case-sensitive, but this can be controlled like this:

	>> ["apple", "flaf", "Hello world!", "Arrrrr"].sort_natural :case_sensitive => true
	=> ["Arrrrr", "Hello world!", "apple", "flaf"]

Also, the plugin adds a couple of other methods:

	[...].sort_natural! # Replace the array with the sorted version
	String.natcmp("hello", "world"[, :case_sensitive => true]) # Compare two strings naturally, default case_sensitive = false



Credits
=======
The *natcmp* method is based on the work by Alan Davies, as described in *lib/core_ext/string.rb*.

Copyright (c) 2008 Logan Raarup, released under the MIT license
