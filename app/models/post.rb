class Post < ApplicationRecord
  validates :syoku, {presence: true, length: {maximum: 15}}
  validates :niku, {presence: true, length: {maximum: 15}}
  validates :kekku, {presence: true, length: {maximum: 15}}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
end
