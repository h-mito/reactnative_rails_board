class BoardController < ApplicationController
  def readBoardAndUser
    response = {status:true}

    boards = Board.all.order("created_at DESC")
    users = User.all.order("id")
    response[:boards] = boards
    response[:users] = users

    render :json=> response
  end

  def insertComment
    response = {status:true}

    c = Comment.new({board_id: params[:board_id], user_id: params[:user_id], comment: params[:comment]})
    c.save()

    render :json=> response
  end

  def readComments
    response = {status:true}
    response["X-CSRF-Token"] = form_authenticity_token


    recs = Comment.eager_load(:user).where("board_id = ?", params[:board_id])
            .order("comments.created_at DESC").as_json(include: :user)
    response["rows"] = recs

    render :json=> response
  end
end
