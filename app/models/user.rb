class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  has_many :movies, :through => :reviews
  has_many :reviews, dependent: :destroy
  
  enum :role, {normal: 'normal', admin: 'admin'}
  validates :role, presence: true

  def admin?
    role == 'admin'
  end
  def normal?
    role == 'normal'
  end
end
