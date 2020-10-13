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
    with_options numericality: { other_than: 1} do
      validates :area
      validates :occupation
      validates :interest
    end
  end
end
