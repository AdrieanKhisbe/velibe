velibe_lib = File.expand_path('../../lib', __FILE__)

if ENV['TRAVIS']
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
    # No need to report coverage metrics for the test code
    add_filter 'test'
    add_filter 'features'
    add_filter 'data'
  end

  # Eager load the entire lib directory so that SimpleCov is able to report
  # accurate code coverage metrics.
  at_exit { Dir["#{velibe_lib}/**/*.rb"].each { |rb| require(rb) } }
end

$LOAD_PATH.unshift velibe_lib
require 'velibe'