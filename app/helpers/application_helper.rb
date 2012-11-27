module ApplicationHelper

  def all_users
    @all_users ||= User.connection.select_values(User.select("email").to_sql)
  end

  def all_posts
    @all_posts ||= Post.connection.select_values(Post.select("id").to_sql)
  end

end
