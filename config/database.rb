configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  if development?
    set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
    }
  else
    set :database, {
      adapter: "postgresql",
      database: 'dd12op9tglj0g9',
      username: 'qvbakyucigozjt',
      port: '5432',
      password: 'LiKQHML2SDQ4Waq7A0xzM-_mHb',
      host: 'ec2-54-83-29-133.compute-1.amazonaws.com'
    }
  end
#hi
  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
