Rails.application.routes.draw do
  resources :artists, :songs

  # resources :songs, only: [index]
  post 'songs/upload', to: 'songs#upload'
end
