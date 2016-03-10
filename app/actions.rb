require "sinatra/json"
require 'byebug'

# Homepage (Root path)
get '/' do
  erb :index
end

get '/contact_list' do
  @contacts = Contact.all
  json @contacts
end

post '/contact_list' do
  content_type :json
  results = {success: false}
  @contact = Contact.new(
    name: params[:name],
    email: params[:email]
    )

  if @contact.save
    results[:success] = true
    results.to_json
  end
end

get '/contact_search' do
  content_type :json
  results = {success: false}
  @contact = Contact.where("name LIKE ? or email LIKE ?", params[:name], params[:email] )
  byebug
end