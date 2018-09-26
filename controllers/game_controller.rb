class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  set :root,
  File.join(File.dirname(__FILE__),'..')

  set :views,
  Proc.new{File.join(root,"views")}
  $id = rand(0..1000)
  $games = [
    {
      :id => $id,
      :title => "Tomb Raider",
      :year => 2013,
      :developer => "Eidos"
      :image => "https://upload.wikimedia.org/wikipedia/en/thumb/f/f1/TombRaider2013.jpg/220px-TombRaider2013.jpg"
      :description => "Tomb Raider is an action-adventure video game developed by Crystal Dynamics and published by Square Enix. Tomb Raider is the tenth title in the Tomb Raider franchise, and operates as a reboot that reconstructs the origins of Lara Croft. Tomb Raider was released on 5 March 2013 for Microsoft Windows, PlayStation 3 and Xbox 360, on 23 January 2014 for OS X, on 27 April 2016 for Linux, and on 7 March 2017 for Shield TV."
    },
    {
      :id => $id,
      :title => "Half-Life",
      :year => 1998,
      :developer => "Valve"
      :image => "https://upload.wikimedia.org/wikipedia/en/thumb/f/fa/Half-Life_Cover_Art.jpg/220px-Half-Life_Cover_Art.jpg"
      :description => "Half-Life is a series of first-person shooter games developed and published by Valve. The major installments feature protagonist Gordon Freeman, a theoretical physicist who battles an alien invasion."
    },
    {
      :id => $id,
      :title => "The Banner Saga",
      :year => 2014,
      :developer => "Stoic Studio"
      :image => "https://www.mobygames.com/images/covers/l/453312-the-banner-saga-windows-front-cover.jpg"
      :description => "The Banner Saga is a fantasy tactical role-playing video game developed by Stoic Studio and published by Versus Evil. It was initially released for personal computers and mobile phones in January 2014. PlayStation 4 and Xbox One versions were released in 2016, with a Nintendo Switch version released in 2018."
    },
    {
      :id => $id,
      :title => "Super Mario 64",
      :year => 1996,
      :developer => "Nintendo"
      :image => "https://static1.squarespace.com/static/55ef0e29e4b099e22cdc9eea/t/577680c4725e2555f21e1d79/1467384042425/?format=1500w"
      :description => "Super Mario 64 is a 1996 platform video game developed and published by Nintendo for the Nintendo 64. It is the first Super Mario game to use three-dimensional graphics. Along with Pilotwings 64, it was one of the launch games for the console."
    },
  ]
  # index
  get '/games' do
    @title = "Games Index"
    @games = $games
  end
  # new
  get '/games/new' do

  end
  # show
  get '/games/:id' do

  end
  # create
  post '/games' do

  end
  # update
  put '/games/:id' do

  end
  # delete
  delete '/games/:id' do

  end
  # edit
  get 'games/:id/edit' do
    
  end
end
