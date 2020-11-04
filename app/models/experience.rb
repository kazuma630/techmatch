class Experience < ActiveHash::Base
  self.data = [
    { id: 1, name: '指定なし' },
    { id: 2, name: '完全未経験' },
    { id: 3, name: '独学中' },
    { id: 4, name: 'スクール生' },
    { id: 5, name: '実務歴1年未満' },
    { id: 6, name: '実務歴1~3年' },
    { id: 7, name: '実務歴3年以上' }
  ]
end
