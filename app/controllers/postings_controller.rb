class PostingsController < ApplicationController
    def index
        @postings = Posting.all
    end

    def show
        @posting = Posting.find(params[:id])
        @comment = Comment.new
    end

    def new
        @posting = Posting.new
    end

    def edit
        @posting = Posting.find(params[:id])
    end

    def destroy
        @posting = Posting.find(params[:id])
        if @posting.destroy
            redirect_to postings_path, :notice => "Delete posting success."
        else
            redirect_to postings_path, :error => "Delete posting failed."
        end
    end

    def create
        @posting = Posting.new(params_posting)
        if @posting.save
            redirect_to postings_path, :notice => "Create new posting success."
        else
            render "new", :error => "Create new posting failed"
        end
    end

    def update
        @posting = Posting.find(params[:id])
        if @posting.update(params_posting)
            redirect_to posting_path(@posting), :notice => "Update posting success."
        else
            render "edit", :error => "Update posting failed"
        end
    end

    def export_xlsx
        @posting = Posting.find(params[:id])
        respond_to do |format|
            format.xlsx
        end
    end

    def import_xlsx
        Posting.import(params[:file])
        redirect_to postings_path, notice: "Products imported."
    end

    def import
    end

    private
        def params_posting
            params.require(:posting).permit(:title, :content)
        end
end
