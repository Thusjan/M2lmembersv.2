require 'sinatra'
require 'sinatra/activerecord'
require 'haml'
require 'json'

set :database, 'sqlite3:///member.db'

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

class Member < ActiveRecord::Base
end

get '/' do
  @title ="Accueil"
  haml :index, :layout_engine => :erb
end


get '/members' do
  @title = "foobar"
  @members = Member.all
  erb :members
end

get '/members/new' do
  erb :new_member
end


get '/members/show/:id' do
  erb :show
end

get '/members.json' do
  content_type 'application/json'
  @title = "foobar"  
  @members = Member.all
  erb :'members.json', layout: false
end

post '/new_member' do
  Member.create({
  nom: params[:nom],
  prenom: params[:prenom],
  adresse: params[:adresse],
  email: params[:email],
  tel: params[:tel]
}
)
  erb :"thanks"
end
get '/members/show/:id.json' do
  content_type :json
  @membre = Membre.find(params[:id])

  {
    id: @member.id,
    prenom: @member.prenom,
    nom: @member.nom,
    datenaiss:@member.datenaiss,
    cp:@membre.cp,
    numtel:@membre.numtel
  }.to_json
end