module ApplicationHelper
  def format_datetime dt
    dt.strftime("%m/%d/%Y %I:%M%P %Z")
  end

  def format_url str 
    str.starts_with?('http://') ? str : "http://#{str}"
  end
end
