module ApplicationHelper
  def error_messages_for(object)
    render(:partial => 'application/invalid', :locals => {:object => object})
  end
end
