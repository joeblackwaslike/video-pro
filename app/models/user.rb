class User < ActiveRecord::Base
  has_many :videos, :dependent => :destroy
  has_secure_password
  validates :password, :presence => { :on => :create }
  validates :email, presence: true, uniqueness: true
  before_save :caseify

  # TODO: Abstract these out to an initializer yml file to make management easier for admins.
  ACCESS_LEVELS = ['Default', 'Moderator', "Manager", 'Developer', 'Admin']

  private

  def caseify
    self.email = self.email.downcase
    self.name = self.name.titlecase
  end

end
