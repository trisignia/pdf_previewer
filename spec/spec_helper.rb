ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.before(:suite) do
    Fog.mock!

    storage = Fog::Storage.new({
      :provider               => "AWS",
      :aws_access_key_id      => Figaro.env.aws_access_key_id,
      :aws_secret_access_key  => Figaro.env.aws_secret_access_key
    })

    storage.directories.create(:key => "docufyi_staging")
  end
end
