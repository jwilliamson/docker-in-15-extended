require 'sinatra'
Bundler.require

begin
  DB = Sequel.connect('postgres://db/app?user=postgres')
rescue => e
  puts "Waiting for connection....."
  sleep 10
  DB = Sequel.connect('postgres://db/app?user=postgres')
end


get '/' do
  'Put this in your pipe & smoke it!'
end

get '/posts' do
  content_type :json

  DB[:posts].all.to_json
end

get '/create_post' do
  content_type :json

  DB[:posts] << { title: params[:title], content: params[:content] }
  DB[:posts].all.to_json
end
