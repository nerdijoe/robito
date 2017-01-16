class SearchesController < ApplicationController
  def new
    @search = Search.new

  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])


    @influencers = Influencer.all.order(created_at: :asc)
    
    @influencers = @influencers.search_by_keyword(@search.keyword) if @search.keyword.present?

    @influencers = @influencers.location(@search.location) if @search.location.present?
    @influencers = @influencers.age(@search.age) if @search.age.present?

    end


  private
  def search_params
    params.require(:search).permit(:keyword, :product_category, :location, :age, :gender, :interests)
  end
end
