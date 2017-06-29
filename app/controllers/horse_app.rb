class HorseApp < Sinatra::Base
  set :method_overide, true

  get '/horses' do
    @horses = Horse.all
    erb :"horses/index"
  end

  get '/horses/:id' do
    @horse = Horse.find(params[:id])
    erb :"horses/show"
  end

  get '/horses/:id/edit' do
    @horse = Horse.find(params[:id])
    erb :"horses/edit"
  end

  put '/horses/:id' do |id|
    Horse.update(id.to_i, params[:horse])
    redirect "/horses/#{id}"
  end

  get '/jockey/:id' do |id|
    @jockey = Jockey.find(id)
    @total_winnings = Horse.total_winnings?(@jockey.id)
    require 'pry' ; binding.pry
    erb :"jockeys/show"
  end
end
