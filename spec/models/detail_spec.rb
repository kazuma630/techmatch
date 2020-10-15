require 'rails_helper'

RSpec.describe Detail, type: :model do
  before do
    @detail = FactoryBot.build(:detail)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'age, area_id, occupation_id, genre_id, school, experience_id, language_id, interest_id, pr, userが存在すれば保存できる。' do
        expect(@detail).to be_valid
      end
      it 'genre_idが未選択でも保存できる' do
        @detail.genre_id = "1"
        expect(@detail).to be_valid
      end
      it 'schoolが無くても保存できる' do
        @detail.school = nil
        expect(@detail).to be_valid
      end
      it 'experience_idが未選択でも保存できる' do
        @detail.experience_id = "1"
        expect(@detail).to be_valid
      end
      it 'language_idが無くても保存できる' do
        @detail.language_id = "1"
        expect(@detail).to be_valid
      end      
      it 'userが紐付いていなくても保存できる' do
        @detail.user = nil
        expect(@detail).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ageが空だと保存できない' do
        @detail.age = nil
        @detail.valid?
        expect(@detail.errors.full_messages).to include("年齢を入力してください")
      end
      it 'area_idが未選択だと保存できない' do
        @detail.area_id = "1"
        @detail.valid?
        expect(@detail.errors.full_messages).to include("居住地を選択してください")
      end
      it 'occupation_idが未選択だと保存できない' do
        @detail.occupation_id = "1"
        @detail.valid?
        expect(@detail.errors.full_messages).to include("職業を選択してください")
      end
      it 'interest_idが未選択だと保存できない'  do
        @detail.interest_id = "1"
        @detail.valid?
        expect(@detail.errors.full_messages).to include("興味を選択してください")
      end
      it 'pr文が空だと保存できない' do
        @detail.pr = nil
        @detail.valid?
        expect(@detail.errors.full_messages).to include("PR文を入力してください")
      end
    end
  end
end
