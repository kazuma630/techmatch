class Interest < ActiveHash::Base
  self.data = [
    { id: 1, name: '指定なし' },
    { id: 2, name: '就職活動' },
    { id: 3, name: '転職活動' },
    { id: 4, name: 'デザイン' },
    { id: 5, name: '情報発信' },
    { id: 6, name: '共同アプリ開発' },
    { id: 7, name: 'プログラミングスクール' },
    { id: 8, name: 'もくもく会' },
    { id: 9, name: 'オフ会' },
    { id: 10, name: 'サーバサイド系' },
    { id: 11, name: 'フロントエンド系' }.
    { id: 12, name: 'インフラ系' }
  ]
end
