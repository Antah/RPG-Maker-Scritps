#==============================================================================
# ? Cooldowns
#==============================================================================
class Game_Actor < Game_Battler
  alias basic_setup setup
  def setup(actor_id)
    basic_setup(actor_id)
    @toxicity = 0.to_i
    @max_toxicity = ((10 + (param(3)-10)/2)).to_i
  end
end

class Game_Battler < Game_BattlerBase

  alias basic_initialize initialize
  def initialize
    basic_initialize
    @toxicity = 0.to_i
  end

  #--------------------------------------------------------------------------
  # alias method: on_battle_start
  # On battle start @cooldowns array get reset/created.
  #--------------------------------------------------------------------------
  alias game_battler_on_battle_start_srs on_battle_start
  def on_battle_start
    game_battler_on_battle_start_srs
    reset_cooldowns
    @toxicity = 0
  end

  #--------------------------------------------------------------------------
  # alias method: on_battle_end
  # -||-
  #--------------------------------------------------------------------------
  alias game_battler_on_battle_end_srs on_battle_end
  def on_battle_end
    game_battler_on_battle_end_srs
    reset_cooldowns
    @toxicity = 0
  end

  #--------------------------------------------------------------------------
  # alias method: item_user_effect
  # After using and item(skill) we call apply_cooldown method.
  #--------------------------------------------------------------------------
  alias game_battler_item_user_effect_srs item_user_effect
  def item_user_effect(user, item)
    game_battler_item_user_effect_srs(user, item)
    #apply_cooldown(user, item)
    #apply_toxicity(user, item)
  end
  alias game_battler_consume_item_srs consume_item
  def consume_item(item)
    game_battler_consume_item_srs(item)
    @toxicity = @toxicity + item.item_toxicity
  end

end # Game_Battler