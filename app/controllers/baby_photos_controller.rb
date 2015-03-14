class BabyPhotosController < ApplicationController
  def index
    @babyphotos = [
      {answer: 'Diane Blair', url: 'photos/Diane Blair 2.jpg'},
      {answer: 'Regina Costa', url: 'photos/Regina Costa.jpg'},
      {answer: 'Eva Csizmadia', url: 'photos/Eva Csizmadia.jpg'},
      {answer: 'Karen Kline', url: 'photos/Karen Kline.jpg'},
      {answer: 'Bonnie Alexander', url: 'photos/Bonnie Alexander.jpg'},
      {answer: 'Kelly Votolato', url: 'photos/Kelly Votolato.jpg'},
      {answer: 'Brenda Hartman', url: 'photos/Brenda Hartman.jpg'},
      {answer: 'Blair Hall', url: 'photos/Blair Hall 2.jpg'},
      {answer: 'Lina Keo', url: 'photos/Lina Keo.jpg'},
      {answer: 'Martha Pearson', url: 'photos/Martha Pearson.jpg'},
      {answer: 'Kathleen Votolato', url: 'photos/Kathleen Votolato.jpg'}]
  end
end
