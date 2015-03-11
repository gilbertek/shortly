require 'rubygems'
require 'bundler'
require 'byebug'

Bundler.require # Load the needed gems from the gemfile.

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
    return 400 unless params["link"].present?

    @link = Url.create(:link => params[:link])
    format_url(@link.short_link.to_s)
  end

  get '/top_links' do
    links = Url.get_top_views
    erb :top_links, locals: {top_links: links}
  end

  get '/:short_link' do
    @link = Url.find(params[:short_link])
    @link.update_clicks
    redirect @link.link
  end



  def format_url(slug)
    return url + slug.to_s
  end
end


