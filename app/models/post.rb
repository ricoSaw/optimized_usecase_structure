class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  validates :body, {:presence => true}
  validates :title, {:presence => true}

  before_create :add_crazy_stuff

  private

  def add_crazy_stuff
    self.body = "This is crazy stuff! #{self.body}" if self.valid?
  end
end
