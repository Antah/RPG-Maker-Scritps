#--------------------------------------------------------------------------
# new method: skill_cooldown
# Returns cooldown of a skill. It should be specified in Notes sections like
# this:
# <cooldown X>
# X - cooldown in turns(int pls)
#--------------------------------------------------------------------------

class RPG::Skill
  def skill_cooldown
    if @cooldown.nil?
      if @note =~ /<cooldown (.*)>/i
        @cooldown = $1.to_i
      else
        @cooldown = 0
      end
    end
    @cooldown
  end
end
