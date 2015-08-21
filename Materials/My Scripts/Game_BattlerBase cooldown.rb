class Game_BattlerBase
  #--------------------------------------------------------------------------
  # Getters/setters for new values
  #--------------------------------------------------------------------------
  attr_reader   :cooldowns
  attr_reader   :toxicity
  attr_reader   :max_toxicity

  #--------------------------------------------------------------------------
  # new method: toxicity_rate
  # Used by several other methods. Returns division of current
  # and maximum toxicity.
  #--------------------------------------------------------------------------
  def toxicity_rate
    if @max_toxicity == nil
      @max_toxicity = (10 + (param(3)-10)/2).to_i
    end
    @toxicity.to_f / @max_toxicity.to_f
  end

  #--------------------------------------------------------------------------
  # Check Usability Conditions for Skill
  # Base method for checking if skill conditions are met is changed so it
  # looks first if the skill is on cooldown. New method skill_on_cooldown?
  # checks if the party is in battle and returns true if cooldown of skill
  # in argument is greater than 0. Otherwise returns false.
  # Method current_cooldown returns current cooldown in @cooldonws array for
  # a skill given as an argument.
  #--------------------------------------------------------------------------
  # alias method: skill_conditions_met?
  # Before even chacking other conditions return false if skill is on
  # cooldown.
  #--------------------------------------------------------------------------
  alias game_battlerbase_skill_conditions_met_srs skill_conditions_met?
  def skill_conditions_met?(skill)
    return false if skill_on_cooldown?(skill)
    return game_battlerbase_skill_conditions_met_srs(skill)
  end

  #--------------------------------------------------------------------------
  # new method: skill_on_cooldown?
  # New method for checking cooldown of skill.
  #--------------------------------------------------------------------------
  def skill_on_cooldown?(skill)
    if $game_party.in_battle
      return true if current_cooldown(skill) > 0
    end
    return false
  end

  #--------------------------------------------------------------------------
  # new method: current_cooldown
  # If argument is a skill and its ID is in the @cooldowns array then its
  # value will be returned. Otherwise returns 0.
  #--------------------------------------------------------------------------
  def current_cooldown(skill)
    if skill.is_a?(RPG::Skill)
      skill_id = skill.id
      return @cooldowns[skill_id].nil? ? 0 : @cooldowns[skill_id]
    end
  end

  #--------------------------------------------------------------------------
  # alias method: item_conditions_met?
  #--------------------------------------------------------------------------
  alias game_battlerbase_item_conditions_met_srs item_conditions_met?
  def item_conditions_met?(item)
    return false if item_toxic?(item)
    return game_battlerbase_item_conditions_met_srs(item)
  end

  #--------------------------------------------------------------------------
  # new method: item_toxic?
  #--------------------------------------------------------------------------
  def item_toxic?(item)
    if $game_party.in_battle
      return true if @toxicity + item.item_toxicity > @max_toxicity
    end
    return false
  end

  #--------------------------------------------------------------------------
  # alias method: pay_skill_cost
  # Method for paying skillcost is changed so it also sets a cooldown for
  # given skill in @cooldowns array.
  #--------------------------------------------------------------------------
  alias game_battlerbase_pay_skill_cost_srs pay_skill_cost
  def pay_skill_cost(skill)
    game_battlerbase_pay_skill_cost_srs(skill)
    set_default_skill_cooldown(skill)
  end

  def set_default_skill_cooldown(skill)
    return unless $game_party.in_battle
    if skill.is_a?(RPG::Skill)
      skill_id = skill.id
      @cooldowns[skill_id] = skill.skill_cooldown
    end
  end

  #--------------------------------------------------------------------------
  # alias method: initialize
  # Initialize method now also creates empty @cooldowns array
  #--------------------------------------------------------------------------
  alias game_battlerbase_initialize_srs initialize
  def initialize
    game_battlerbase_initialize_srs
    reset_cooldowns
    @toxicity = 0
  end

  #--------------------------------------------------------------------------
  # new method: reset_cooldowns
  # Methd for creating/reseting @cooldowns array
  #--------------------------------------------------------------------------
  def reset_cooldowns
    @cooldowns = []
  end

  #--------------------------------------------------------------------------
  # new method: set_cooldown
  # By default this method will reduce cooldown of a skill given as argument
  # by 1. It can be called with a second argument defiing and amount by which
  # cooldown should be changed(it can be even a positive number).
  # If after this operation cooldown of a skill is lesser than 0 its cooldown
  # gets removed from @cooldonws array.
  #--------------------------------------------------------------------------
  def set_cooldown(skill, amount = -1)
    return unless $game_party.in_battle
    skill_id = skill.id if skill.is_a?(RPG::Skill)
    if @cooldowns[skill_id] == nil
      @cooldowns[skill_id] = amount
    else
      @cooldowns[skill_id] = @cooldowns[skill_id] + amount
    end
    if @cooldowns[skill_id] <= 0
      @cooldowns[skill_id] = nil
    end
  end

  #--------------------------------------------------------------------------
  # new method: update_cooldown
  # By default this methdo will call set_cooldown method for every skill of
  # battler.
  # If an amount is specified, every change in cooldown will by by
  # by this amount.
  # If a skill type is specified, only skills with this type will be affected.
  # If skill id is specified, only this particular skill will be affected.
  #--------------------------------------------------------------------------
  def update_cooldowns(amount = -1, stype_id = 0, skill_id = 0)
    reset_cooldowns if @cooldowns.nil?
    for skill in skills
      skill = $data_skills[skill] if !skill.is_a?(RPG::Skill)
      next if stype_id != 0 && skill.stype_id != stype_id
      next if skill_id != 0 && skill.id != skill_id
      set_cooldown(skill, amount)
    end
  end
  def update_toxicity
    @toxicity = @toxicity - 2
    @toxicity = 0 if @toxicity < 0
  end

end