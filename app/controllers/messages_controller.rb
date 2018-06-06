class MessagesController < InheritedResources::Base

  private

    def message_params
      params.require(:message).permit(:recieved, :reply)
    end
end

