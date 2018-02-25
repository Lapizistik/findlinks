# Findlinks

A HTML page may contain links/references to other pages/files/images etc.
in various attributes of several elements (a.href, img.src, …).

[`link-elements.yaml`](https://github.com/lapizistik/findlinks/data/link-elements.yaml) provides a
list of HTML elements and attributes which contain URLs (see below) and
may be useful for other languages too.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'findlinks'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install findlinks

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lapizistik/findlinks.

## Credits and Sources

To assemble the list of elements and attributes `link-elements.yaml` I used

- [HTML5 Attributes list from the w3 specs](https://www.w3.org/TR/html5/fullindex.html#attributes-table)
- [HTML4 Attributes list from the w3 specs](https://www.w3.org/TR/REC-html40/index/attributes.html)

I also had a look into

- the [wget](https://www.gnu.org/software/wget/) [sources](http://git.savannah.gnu.org/cgit/wget.git/tree/src/html-url.c#n95)
- the [spidr](https://github.com/postmodern/spidr#readme) gem [sources](https://github.com/postmodern/spidr/blob/master/lib/spidr/page/html.rb)
