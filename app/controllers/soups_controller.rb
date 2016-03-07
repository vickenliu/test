class SoupsController < ApplicationController
	before_action :get_category, only: [:new, :create, :show]
	def new
		
		@soup=@category.soups.new()
		
	end
	def create
		
		@soup=@category.soups.create(soup_params)
		
			redirect_to @category

	end
	def show
		@soup=@category.soups.find(params[:id])
	end
	def toggle_feature
		@soup=Soup.find(params[:id])
		@soup.toggle!(:featured)
		flash[:notice]='Successfully changed the feature'
		redirect_to [@soup.category, @soup]
		
	end
	def get_category
		@category=Category.find(params[:category_id])
	end

	private
	def soup_params
		params.require(:soup).permit(:name, :featured)
		
	end
end
