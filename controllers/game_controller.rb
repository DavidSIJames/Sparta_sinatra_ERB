class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  # setting the root as the parent diretory of the current directory
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory coreectly
  set :views, Proc.new{File.join(root,"views")}

  $games = [
    {
      :id => 1,
      :title => "Tomb Raider",
      :year => 2013,
      :dev => "Eidos",
      :image => "https://upload.wikimedia.org/wikipedia/en/thumb/f/f1/TombRaider2013.jpg/220px-TombRaider2013.jpg",
      :description => "Tomb Raider is an action-adventure video game developed by Crystal Dynamics and published by Square Enix. Tomb Raider is the tenth title in the Tomb Raider franchise, and operates as a reboot that reconstructs the origins of Lara Croft. Tomb Raider was released on 5 March 2013 for Microsoft Windows, PlayStation 3 and Xbox 360, on 23 January 2014 for OS X, on 27 April 2016 for Linux, and on 7 March 2017 for Shield TV."
    },
    {
      :id => 2,
      :title => "Half-Life",
      :year => 1998,
      :dev => "Valve",
      :image => "https://upload.wikimedia.org/wikipedia/en/thumb/f/fa/Half-Life_Cover_Art.jpg/220px-Half-Life_Cover_Art.jpg",
      :description => "Half-Life is a series of first-person shooter games developed and published by Valve. The major installments feature protagonist Gordon Freeman, a theoretical physicist who battles an alien invasion."
    },
    {
      :id => 3,
      :title => "The Banner Saga",
      :year => 2014,
      :dev => "Stoic Studio",
      :image => "https://www.mobygames.com/images/covers/l/453312-the-banner-saga-windows-front-cover.jpg",
      :description => "The Banner Saga is a fantasy tactical role-playing video game developed by Stoic Studio and published by Versus Evil. It was initially released for personal computers and mobile phones in January 2014. PlayStation 4 and Xbox One versions were released in 2016, with a Nintendo Switch version released in 2018."
    },
    {
      :id => 4,
      :title => "Super Mario 64",
      :year => 1996,
      :dev => "Nintendo",
      :image => "https://upload.wikimedia.org/wikipedia/en/thumb/6/6a/Super_Mario_64_box_cover.jpg/220px-Super_Mario_64_box_cover.jpg",
      :description => "Super Mario 64 is a 1996 platform video game developed and published by Nintendo for the Nintendo 64. It is the first Super Mario game to use three-dimensional graphics. Along with Pilotwings 64, it was one of the launch games for the console."
    }
  ]
  # index
  get '/games' do
    @title = "Games Index"
    @games = $games
    erb :'games/index'
  end
  # new
  get '/games/new' do
    erb :'games/new'
  end
  # show
  get '/games/:id' do
    id = params[:id].to_i - 1
    @select_game = $games[id]
    erb :'games/show'
  end
  # create
  post '/games' do
    newGame = {
      :id => $games.length + 1,
      :title => params[:title],
      :year => params[:year],
      :dev => params[:dev],
      :image => params[:image],
      :description => params[:description]
    }
    $games.push(newGame)
    redirect '/games'
  end
  # update
  put '/games/:id' do
    id = params[:id].to_i - 1
    game_edit = $games[id]
    game_edit[:title] = params[:title]
    game_edit[:year] = params[:year]
    game_edit[:dev] = params[:dev]
    game_edit[:image] = params[:image]
    game_edit[:description] = params[:description]
    $games[id] = game_edit
    redirect '/games'
  end
  # delete
  delete '/games/:id' do
    id = params[:id].to_i - 1
    $games.delete_at id
    redirect '/games'
  end
  # edit
  get '/games/:id/edit' do
    id = params[:id].to_i - 1
    @select_game = $games[id]
    erb :'games/edit'
  end
end
