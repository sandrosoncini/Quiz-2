class LikesController < ApplicationController
    before_action :authenticate_user

    def create
      like = Like.new
      review = Review.find params[:campaign_id]
      like.review = campaign
      like.user = current_user
      if like.save
        redirect_to review_path(review), notice: "Thanks for liking!"
      else
        redirect_to review_path(review), alert: "Can't like! Liked already?"
      end
    end

    def destroy
        review = Campaign.find params[:campaign_id]
        like = current_user.likes.find params[:id]
        like.destroy
        redirect_to review_path(review), notice: "Like removed!"
      end
end
