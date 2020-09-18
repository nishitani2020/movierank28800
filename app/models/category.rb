class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アクション' },
    { id: 3, name: 'ミステリー' },
    { id: 4, name: 'SF' },
    { id: 5, name: 'コメディ' },
    { id: 6, name: 'ホラー' },
    { id: 7, name: '恋愛' },
    { id: 8, name: 'サスペンス' },
    { id: 9, name: 'ファンタジー' },
    { id: 10, name: 'アニメ' },
    { id: 11, name: 'その他' }
  ]
end
