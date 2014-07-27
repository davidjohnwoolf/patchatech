module TutorialsHelper
  def rated?
    @tutorial.user_rated.include?("#{current_user.id}")
  end
end
