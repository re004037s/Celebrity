module SkillsheetHelper
  def is_my_skill_sheet?(user_id)
    return (current_user.id === user_id) ? true : false
  end
  
  def is_skillsheet_default?(user_skillsheet_name)
    return (user_skillsheet_name === "未登録") ? true : false
  end
end
