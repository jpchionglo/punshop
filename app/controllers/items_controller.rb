class ItemsController < ApplicationController
  
#CREATE

    def new
        #unless current_user.present?
        #    redirect_to students_url
        #end
        @new = Item.new
    end
    
    def create
        @new = Item.new
        @new.name          = params["name"]
        @new.price         = params["price"]
        @new.image         = params["image"] 
        @new.description    = params["description"]

        if @new.save
            redirect_to "/items", :notice => "Item created successfully."
        else
            render "new"
        end
    end

#READ

    def show 
        @item = Item.find_by(:id => params[:id])
        if @item.present?
            render "show"
        else
            redirect_to items_url, :notice => "The item doesn't exist."
        end
    end
    
    def index
        @item = Item.all
        render "index"
    end

#UPDATE

    def edit
        @item=Item.find(params[:id])
        render "edit"
    end
    
    def update
        @item=Item.find(params[:id])
        @item.name          = params["name"]
        @item.price         = params["price"]
        @item.image         = params["image"] 
        @item.description   = params["description"]
        
        if @item.save
            redirect_to item_url(@item.id)
        else
            render "new"
        end
    end
    
#DESTROY

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to "/items", :notice => "Item deleted."
    end
end
