Nothing lasts, yet nothing is lost
==================================

When you push your own code, please name the branch according to your
kata and with your names, e.g. `bowling-botimer-mattlach`.

I plan on deleting all such branches with some regularity. This
repository is for practice---not products.

Your choices of starting branch:

-   `primefactors`: List an integer's prime factors.
-   `readroman`: Convert roman numeral strings to integers.
-   `isbn`: Validate ISBN strings.

How do I set up rspec?
----------------------

A typical setup will look something like this:

    $ tree
    .
    |-- Gemfile
    |-- lib
    |   \-- my_project_name.rb
    \-- spec
        \-- my_project_name_spec.rb

    $ cat Gemfile
    source 'https://rubygems.org'
    gem 'rspec'

    $ cat spec/my_project_name_spec.rb
    require 'my_project_name'

    RSpec.describe TheClassWeAreTesting do
      it 'can be instantiated' do
        instance = TheClassWeAreTesting.new()
      end
    end

At least once, you'll need to install rspec:

    $ bundle install

To run tests, `rspec spec` should get it done, but in case your setup is
weird or something, this should be foolproof:

    $ bundle exec rspec spec

How do I set it up to automatically run tests when a file changes?
------------------------------------------------------------------

Install [entr](https://github.com/clibs/entr).

It takes a (newline-separated) list of files to watch as standard input,
and then it runs whatever you give it as arguments. To watch all the
files under your current directory, for example, run this:

    $ find * -type f | entr bundle exec rspec spec

Or, if you want to only watch files which are already added to your git
repository, you can run this:

    $ git ls-files | entr bundle exec rspec spec

If you add new files, you'll need to ctrl-C out and re-run the command
for entr to start paying attention to your new files.
