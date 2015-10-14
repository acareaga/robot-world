require 'rake/testrobot'
require 'bundler'
Bundler.require

task :test do
  Dir.global('./test/**/*_test.rb') { |file| require file }
end
