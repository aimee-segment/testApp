require 'sinatra'
require 'segment/analytics'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
    Analytics = Segment::Analytics.new({
        write_key: '006v7NUMbyHEZOfLS3K0fBIxMvhgcZr7',
        on_error: Proc.new { |status, msg| print msg }
    });
        
    
    Analytics.page(anonymous_id: '1021-172-2122', category: 'General', name: 'Home', properties: { url: 'http://localhost:8080/'});
    
    ##Analytics.track(anonymous_id: '1021-172-2122', event: 'Article Bookmarked', properties: {title: 'How to Create a Tracking Plan', course: 'Intro to Analytics'});
    
    erb :hello_form
end

get '/hello/' do
    erb :hello_form
    
end

post '/hello/' do
    userId = params[:userId] || "2341234"
    name = params[:name] || "Nobody"
    email = params[:email] || "jdoe@yahoo.com"
    
    Analytics.identify(
                       user_id: userId,
                       traits: { name: name, email: email },
                       context: {ip: '17.0.0.3'});
    
    Analytics.track(user_id: userId, event: 'User Registered');

    erb :index, :locals => {'userId' => userId, 'name' => name, 'email' => email}
    
end
