class WelcomeController < ApplicationController

  def index
    @post = Post.all.order("created_at asc").sort_by(&:score).reverse.first
  end

end
