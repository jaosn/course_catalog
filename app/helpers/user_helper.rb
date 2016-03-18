module UserHelper
  def registered?(id)
    user = User.find_by(id: session[:user_id])
    user.enrollments.each do |e|
      if e.course_id == id
        return true
      end
    end
    return false
  end
end
