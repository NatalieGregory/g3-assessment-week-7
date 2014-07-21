require 'sinatra/base'
require 'gschool_database_connection'

require './lib/country_list'

class Application < Sinatra::Application

  def initialize
    super
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV'])
  end

  get '/' do
    erb :index


    # post '/' do
    #   @model = Model.new(params[:model])
    #   if @model.save
    #     redirect '/models'
    #   else
    #     "Sorry, there was an error!"
    #   end
    # end

    # post "/" do
    #   login_sql = <<-SQL
    #   SELECT * FROM users
    #   WHERE username = '#{params[:name]}'
    #   AND password = '#{params[:message]}'
    #   SQL
    #
    #   user = @database_connection.sql(login_sql).first
    #
    #   if user
    #     session[:id] = user.fetch("id")
    #   end
    #
    #   redirect "/"

  end

  get '/continents' do
    all_continents = CountryList.new.continents
    erb :continents, locals: { continents: all_continents }
  end

  get '/continents/:continent_name' do
    list_of_countries = CountryList.new.countries_for_continent(params[:continent_name])
    erb :countries, locals: { countries: list_of_countries, continent: params[:continent_name] }
  end

end