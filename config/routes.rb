Rails.application.routes.draw do
  get '/letter_opener', to: 'letter_opener/letters#index', as: :letter_opener_letters
  get '/letter_opener/:id/:style.html', to: 'letter_opener/letters#show', as: :letter_opener_letter
end
