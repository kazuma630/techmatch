class PostsTag

  include ActiveModel::Model
  attr_accessor :title, :content, :date, :time_first, :time_end, :people, :name, :user_id

  with_options presence: true do
    validates :title
    validates :content
    validates :name
  end

  delegate :persisted?, to: :post

  def initialize(attributes = nil, post: Post.new)
    @post = post
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    post = Post.create(title: title, content: content, date: date, time_first: time_first, time_end: time_end, people: people, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

  def update
    # post = Post.update(title: title, content: content, date: date, time_first: time_first, time_end: time_end, people: people, user_id: user_id)
    post.update!(title: title, content: content, date: date, time_first: time_first, time_end: time_end, people: people, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.update!(name: name)
    # tag.save
    posttag = PostTagRelation.where(post_id: post.id)
    posttag.update(post_id: post.id, tag_id: tag.id)
    # posttag.destroy
    # PostTagRelation.create(post_id: post.id, tag_id: tag.id)
    # posttag = PostTagRelation.find(post_id: post.id)
    
  end

  def to_model
    post
  end

  private

  attr_reader :post

  def default_attributes
    {
      title: post.title,
      content: post.content,
      name: post.tags.pluck(:name),
      date: post.date,
      time_first: post.time_first,
      time_end: post.time_end
    }
  end
end