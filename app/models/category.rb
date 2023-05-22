class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'マンガ・コミック' },
    { id: 3, name: '小説' },
    { id: 4, name: '趣味・生活関連の実用書' },
    { id: 5, name: '雑誌(マンガ以外)' },
    { id: 6, name: 'ビジネス書' },
    { id: 7, name: 'マンガ雑誌' },
    { id: 8, name: 'ノンフィクション' },
    { id: 9, name: 'エッセイ' },
    { id: 10, name: 'ライトノベル' },
    { id: 11, name: '語学・資格関連' },
    { id: 12, name: '写真集' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :books
  end