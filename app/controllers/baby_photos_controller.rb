class BabyPhotosController < ApplicationController
  def index
    @babyphotos = [
      {answer: 'Diane Blair', url: 'photos/Diane Blair 1.jpg'},
      {answer: 'Diane Blair', url: 'photos/Diane Blair 2.jpg'},
      {answer: 'Blair Hall', url: 'photos/Blair Hall 1.jpg'},
      {answer: 'Blair Hall', url: 'photos/Blair Hall 2.jpg'},
      {answer: 'Eva Csizmadia', url: 'photos/Eva Csizmadia.jpg'},
      {answer: 'Karen Kline', url: 'photos/Karen Kline.jpg'},
      {answer: 'Regina Costa', url: 'photos/Regina Costa.jpg'},
      {answer: 'Bonnie Alexander', url: 'photos/Bonnie Alexander.jpg'},
      {answer: 'Kathleen Votolato', url: 'photos/Kathleen Votolato.jpg'},
      {answer: 'Kathleen Votolato', url: 'photos/Kathleen Votolato.jpg'},
      {answer: 'Kathleen Votolato', url: 'photos/Kathleen Votolato.jpg'},
      {answer: 'Kathleen Votolato', url: 'photos/Kathleen Votolato.jpg'},
      {answer: 'Kathleen Votolato', url: 'photos/Kathleen Votolato.jpg'},
      {answer: 'Kathleen Votolato', url: 'photos/Kathleen Votolato.jpg'},
      {answer: 'Kathleen Votolato', url: 'photos/Kathleen Votolato.jpg'},
      {answer: 'Kathleen Votolato', url: 'photos/Kathleen Votolato.jpg'}]
  end
end
