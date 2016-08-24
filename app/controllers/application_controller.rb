class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


def set_header(p_type, filename)
  case p_type
    when 'xls'
     headers['Content-Type'] = "application/vnd.ms-excel; charset=UTF-8'"
     headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
     headers['Cache-Control'] = ''

    when 'msword'
     headers['Content-Type'] = "application/vnd.ms-word; charset=UTF-8"
     headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
     headers['Cache-Control'] = ''

   end
 end
  
end
