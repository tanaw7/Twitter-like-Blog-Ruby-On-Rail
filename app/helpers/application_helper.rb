module ApplicationHelper

  def all_users
    @vall_users ||= User.connection.select_values(User.select("email").to_sql)
  end

  def all_posts
    @vall_posts ||= Post.connection.select_values(Post.select("id").to_sql)
    #@vall_posts ||= Post.all.each {|i| puts i.id }
  end

end
