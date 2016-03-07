class CategoriesController < ApplicationController
	def index
		@categories=Category.all
		
	end
	def new
		@category= Category.new
	end
	def create
		@category=Category.create(category_param)
		redirect_to @category
	end
	def edit
		@category=Category.find(params[:id])

	end
	def update
		@category=Category.find(params[:id])
		@category.update(category_param)
		redirect_to @category

	end
	def destroy
		@category=Category.find(params[:id])
		 if @category.destroy
		 	flash[:notice]='the category has been deleted'
		 	redirect_to categories_path
		 else
		 	flash[:notice]='there is an error to delete'
		 	render @category
		 end

		
	end
	def show
		@category=Category.find(params[:id])
		@soups=@category.soups
		
	end
	def vip
		session[:vip]=true
		redirect_to categories_path
		
	end
	def logout
		session[:vip]=false
		redirect_to categories_path
		
	end

	private
	def category_param
		params.require(:category).permit(:name)
	end

end
