require File.join(File.dirname(__FILE__), 'boot')        

if Gem::VERSION >= "1.3.6"
    module Rails
        class GemDependency
            def requirement
                r = super
                (r == Gem::Requirement.default) ? nil : r
            end
        end
    end
end


RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.gem 'declarative_authorization', :source => 'http://gemcutter.org'
  config.gem 'searchlogic'
  config.gem 'prawn', :version=> '0.6.3'

  config.load_once_paths += %W( #{RAILS_ROOT}/lib )
  config.load_paths += Dir["#{RAILS_ROOT}/app/models/*"].find_all { |f| File.stat(f).directory? }
end
