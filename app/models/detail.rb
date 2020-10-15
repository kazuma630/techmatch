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
end
