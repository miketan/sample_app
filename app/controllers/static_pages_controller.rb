class StaticPagesController < ApplicationController
  def home
  	if signed_in?
#<<<<<<< HEAD
      redirect_to current_user
  	end
#=======
    #  @micropost  = current_user.microposts.build
    #  @feed_items = current_user.feed.paginate(page: params[:page])
    #end
#>>>>>>> user-microposts
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
