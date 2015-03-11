require 'rubygems'
require 'bundler'
require 'byebug'

Bundler.require # Load the needed gems from the gemfile.

$: << File.expand_path('../', __FILE__) # Required so that Sinatra knows where to find all the routes and such.
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

class App < Sinatra::Base

  configure :production, :development do
    set :public_folder, ->{ File.join(File.dirname(__FILE__), './../public')}

    set :views, ->{ File.join(File.dirname(__FILE__), './../views')}
    db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/cutly')

    ActiveRecord::Base.establish_connection(
        :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
        :host     => db.host,
        :username => db.user,
        :password => db.password,
        :database => db.path[1..-1],
        :encoding => 'utf8'
    )
  end

  get '/' do
    format_url("Uesu")
    erb :index
  end

  post "/" do
    @link = Url.create(:link => params[:link])
    format_url(@link.id.to_s)
  end

  def format_url(slug)
    return url + slug.to_s
  end
end


