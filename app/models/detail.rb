class Detail < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :occupation
  belongs_to_active_hash :genre
  belongs_to_active_hash :experience
  belongs_to_active_hash :language
  belongs_to_active_hash :interest

  with_options presence: true do
    validates :age
    validates :pr
  end
  validates :area_id, numericality: { other_than: 1, message: "を選択してください"}
  validates :occupation_id, numericality: { other_than: 1, message: "を選択してください"}
  validates :interest_id, numericality: { other_than: 1 , message: "を選択してください"}

  # def self.wizard
  #   find_or_create_by!(user_id: user.id) do |detail|
  #     detail.age = '21'
  #     detail.area_id = '2'
  #     detail.occupation_id = '18'
  #     detail.genre_id = '1'
  #     detail.school = ''
  #     detail.experience_id = '1'
  #     detail.language_id = '4'
  #     detail.interest_id = '2'
  #     detail.pr = 'web系エンジニアの働き方や仕事に興味がありアプリをはじめました。何卒よろしくお願いします！'
  #     detail.user_id = user.id
  #   end
  # end
end
