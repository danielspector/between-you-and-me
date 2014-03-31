class MessagesController < ApplicationController
  before_action :find_center

  def index
    @messages = @center.messages.all
    @message = Message.new
  end

  def create
    @message = @center.messages.create(message_params)
  end

  private

  def find_center
    @center = Center.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:name, :content)
  end
end