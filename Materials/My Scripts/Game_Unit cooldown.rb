class Game_Unit

  #--------------------------------------------------------------------------
  # new method: update_restrictions
  # This method will call new method for every member of party/enemies.
  #--------------------------------------------------------------------------
  def update_restrictions
    for member in members
      member.update_cooldowns
      member.update_toxicity
    end
  end

end # Game_Unit