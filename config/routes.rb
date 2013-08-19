SongStable::Application.routes.draw do

  scope :module => 'pub' do
  	resources :songs
  end

  namespace :admin do
    root :to => "songs#index", :controller => 'songs', :namespace => 'admin'

    resources :songs do
      scope :module => 'songs' do
      end
    end

  end

  root :to => 'pub::songs#index'

end
