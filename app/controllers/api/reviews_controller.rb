class Api::ReviewsController < ApplicationController

   def index
    if params[:restaurant_id]
      @reviews = Review.where(restaurant_id: params[:restaurant_id])
    else
      @reviews = Review.all
    end
      
    render json: @reviews
  end

    def show
        # debugger
        @review = Review.find(params[:id])

        render :show
    end

    def create
        @review = Review.new(review_params)

        if @review.save
            render :show, include: :user
        else
            render json: @review.errors.full_messages, status: 422
        end
    end

    def update
        @review = Review.find(params[:id])

        if @review.update(review_params)
            render :show, include: :user
        else
            render json: @review.errors.full_messages, status: 422
        end
    end

    def destroy 
        @review = Review.find(params[:id])

        if @review && @review.reviewer_firstname == current_user.email
            @review.destroy
        end
    end 
      

    private

    def review_params
        params.require(:review).permit(:nickname, :body, :overall, :food, :service, :ambience, :value, :user_id, :restaurant_id, :reviewer_firstname, :restaurant_name)
    end
end