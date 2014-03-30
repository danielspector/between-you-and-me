class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:name, :content)
  end
end