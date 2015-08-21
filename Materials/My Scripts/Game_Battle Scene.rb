class Scene_Battle < Scene_Base

  #--------------------------------------------------------------------------
  # alias method: turn_start
  # At the start of each turn this method will call new Game_Unit method.
  #--------------------------------------------------------------------------
  alias scene_battle_turn_start_srs turn_start
  def turn_start
    $game_party.update_restrictions #party
    $game_troop.update_restrictions #enemies
    scene_battle_turn_start_srs
  end

end # Scene_Battle