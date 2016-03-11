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
      database: 'postgres://dfgbfcuzjjrlwv:kGtc8ZnjnS4BDdFgo1Uo_94MJu@ec2-107-21-120-109.compute-1.amazonaws.com:5432/d38s50png8jfbl'
      # username: 'dfgbfcuzjjrlwv',
      # port: '5432',
      # password: 'kGtc8ZnjnS4BDdFgo1Uo_94MJu',
      # host: 'ec2-107-21-120-109.compute-1.amazonaws.com'
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
