# ElevatorPitchGenerator

Elevator Pitch Generator is Elevator Pitch Generator.

## Elevator Pitch
[Elevator Pitch](./elevator_pitch/README.md)

## Installation

Add this line to your application's Gemfile:

    gem 'elevator_pitch_generator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elevator_pitch_generator

## Usage
### Steps
* generate Epitchfile

~~~bash
epitchgen init
~~~

generated File

~~~ruby
# encoding: utf-8

# For [potential needs or solution]
# needs is required
# needs allow only String
# needs's default value => "For TODO: write potential needs or solution"
needs "For TODO: write potential needs or solution"

# who [target]
# target is required
# target allow only String
# target's default value => "who TODO: write target"
target "who TODO: write target"

# The [product_name]
# product_name is required
# product_name allow only String
# product_name's default value => "The TODO: write product_name"
product_name "The TODO: write product_name"

# is a [category]
# category is required
# category allow only String
# category's default value => "is a TODO: write category"
category "is a TODO: write category"

# that [merit]
# merit is required
# merit allow only String
# merit's default value => "that TODO: write merit"
merit "that TODO: write merit"

# Unlike [difference of competition]
# diff_of_competition is required
# diff_of_competition allow only String
# diff_of_competition's default value => "Unlike TODO: write difference of competition"
diff_of_competition "Unlike TODO: write difference of competition"

# it [most important point]
# most_important_point is required
# most_important_point allow only String
# most_important_point's default value => "it TODO: write most important point"
most_important_point "it TODO: write most important point"
~~~

* edit Epitchfile manually.

~~~ruby
# encoding: utf-8

needs "For creator"
target "who supply some product"
product_name "The Elevator Pitch Generator"
category "is a generator of Elevator Pitch"
merit "that generate Elevator Pitch template automatically"
diff_of_competition "Unlike manuall-create that is redundant operation"
most_important_point "it provides formated template for Elevator Pitch"
~~~

* generate Elevator Pitch from Epitchfile

~~~bash
epitchgen generate
~~~

./elevator_pitch/README.md

~~~ruby
# The Elevator Pitch Generator's Elevator Pitch

## For creator
## who supply some product
## The Elevator Pitch Generator
## is a generator of Elevator Pitch
## that generate Elevator Pitch template automatically
## Unlike manuall-create that is redundant operation
## it provides formated template for Elevator Pitch
~~~

* append link in your project-root README.md

~~~markdown
[Elevator Pitch](./elevator_pitch/README.md)
~~~

## History
* version 0.0.1  : first release.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
