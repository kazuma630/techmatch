class PostsTag

  include ActiveModel::Model
  attr_accessor :title, :content, :date, :time_first, :time_end, :people, :name

  with_options presence: true do
    validates :title
    validates :content
    validates :name
  end

  def save
    user = User.create(name: name)
    post = Post.create(title: title, content: content, date: date, time_first: time_first, time_end: time_end, people: people, user_id: user.id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end
end