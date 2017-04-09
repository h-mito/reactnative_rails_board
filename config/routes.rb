Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'board/readBoardAndUser'
  post 'board/insertComment'
  get 'board/readComments/:board_id' => 'board#readComments'

end
