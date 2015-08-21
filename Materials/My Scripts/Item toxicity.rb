#--------------------------------------------------------------------------
# new method: skill_cooldown
# Returns cooldown of a skill. It should be specified in Notes sections like
# this:
# <cooldown X>
# X - cooldown in turns(int pls)
#--------------------------------------------------------------------------

class RPG::Item
  def item_toxicity
    if @toxicity.nil?
      if @note =~ /<toxicity (.*)>/i
        @toxicity = $1.to_i
      else
        @toxicity = 0
      end
    end
    @toxicity
  end
end
