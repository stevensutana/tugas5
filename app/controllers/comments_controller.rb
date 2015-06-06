class CommentsController < ApplicationController
    def create
        @comment = Comment.new(param_comment)
        @posting = Posting.find(@comment.posting_id)

        if @comment.save
            redirect_to posting_path(@posting), :notice => "Create new comment success."
        else
            redirect_to posting_path(@posting), :notice => "Create new comment failed."
        end
    end

    private
        def param_comment
            params.require(:comment).permit(:title, :content, :posting_id)
        end
end
