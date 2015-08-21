module BattleLuna
  module HUD
    BATTLER_HUD_tmp = {
        :toxicity_num => {
            :enable   =>  true, # Enable HP Numbers? True/False
            # -----------------------------------------------------------------
            # Offset Values refer to how much you want to nudge the window display
            # without affecting its base x, y and z.
            # -----------------------------------------------------------------
            :offset_x =>  0,
            :offset_y =>  0,
            :offset_z =>  20,
            # -----------------------------------------------------------------
            # Type allows you to set the type of graphic you want to use.
            # # 0 - Default font; 1 - Custom number picture sheet;
            # -----------------------------------------------------------------
            :type     =>  0,
            :ani_rate =>  0.05, # Max is 1.00. Refers to animate speed/rate.
            #--- START 2013.09.02
            :with_max =>  false, # Set to true to show max value in this sprite.
            # Only works with type 0.
            :text     =>  "%d/%d", # Only available	 for :with_max == true
            #--- END 2013.09.02
            :type_0   =>  {
                :width    =>  92,  # Change the width of the number rect.
                :height   =>  24,  # Change the height of the number rect.
                # -----------------------------------------------------------------
                # Set the color for the name display. [R,G,B,A]
                # You can also use normal_color to use the default font color.
                # -----------------------------------------------------------------
                :color    =>  [255, 255, 255, 255],
                # -----------------------------------------------------------------
                # Set the outline color for the name display. [R,G,B,A]
                # You can also use normal_color to use the default outline color.
                # -----------------------------------------------------------------
                :outline  =>  [0, 0, 0, 255],
                :bold     =>  false, # Enable Bold? True/False
                :italic   =>  false, # Enable Italic? True/False
                # -----------------------------------------------------------------
                # Set alignment settings.
                # 0 = Left/Default, 1 = Center, 2 = Right
                # -----------------------------------------------------------------
                :align    =>  2,
                :font     =>  "VL Gothic", # Set Font type.
                :size     =>  18,          # Set Font Size
            },
            #---
            :type_1   =>  {
                :width    =>  80,              # Change the width of the number rect.
                # Use for adjusting alignment.
                :filename =>  "Skin_NumSmall", # Picture Filename.
                :spacing  =>  -2,              # Add spacing
                # -----------------------------------------------------------------
                # Set alignment settings.
                # 0 = Left/Default, 1 = Center, 2 = Right
                # -----------------------------------------------------------------
                :align    =>  2,
            },
        }, # End toxicity_num.
        :max_toxicity_num => {
            :enable   =>  false, # Enable Max HP Numbers? True/False
            # -----------------------------------------------------------------
            # Offset Values refer to how much you want to nudge the window display
            # without affecting its base x, y and z.
            # -----------------------------------------------------------------
            :offset_x =>  76,
            :offset_y =>  56,
            :offset_z =>  5,
            # -----------------------------------------------------------------
            # Type allows you to set the type of graphic you want to use.
            # # 0 - Default font; 1 - Custom number picture sheet;
            # -----------------------------------------------------------------
            :type     =>  0,
            :ani_rate =>  0.05, # Max is 1.00. Refers to animate speed/rate.
            #---
            :type_0   =>  {
                :width    =>  76,  # Change the width of the number rect.
                :height   =>  24,   # Change the height of the number rect.
                # -----------------------------------------------------------------
                # Set the color for the name display. [R,G,B,A]
                # You can also use normal_color to use the default font color.
                # -----------------------------------------------------------------
                :color    =>  [255, 255, 255, 255],
                # -----------------------------------------------------------------
                # Set the outline color for the name display. [R,G,B,A]
                # You can also use normal_color to use the default outline color.
                # -----------------------------------------------------------------
                :outline  =>  [0, 0, 0, 255],
                :bold     =>  true, # Enable Bold? True/False
                :italic   =>  false, # Enable Italic? True/False
                # -----------------------------------------------------------------
                # Set alignment settings.
                # 0 = Left/Default, 1 = Center, 2 = Right
                # -----------------------------------------------------------------
                :align    =>  2,
                :font     =>  "Times New Roman", # Set Font type.
                :size     =>  16,          # Set Font Size
            },
            #---
            :type_1   =>  {
                :width    =>  76,               # Change the width of the number rect.
                # Use for adjusting alignment.
                :filename =>  "Btskin_numbers", # Picture Filename.
                :spacing  =>  -2,               # Add spacing
                # -----------------------------------------------------------------
                # Set alignment settings.
                # 0 = Left/Default, 1 = Center, 2 = Right
                # -----------------------------------------------------------------
                :align    =>  2,
            },
        }, # End max_toxiciyt_num.
        :toxicity_bar => {
            :enable   =>  true, # Enable EXP Bars? True/False
            # -----------------------------------------------------------------
            # Offset Values refer to how much you want to nudge the window display
            # without affecting its base x, y and z.
            # -----------------------------------------------------------------
            :offset_x =>  0,
            :offset_y =>  0,
            :offset_z =>  15,
            # -----------------------------------------------------------------
            # Type allows you to set the type of graphic you want to use.
            # 0 - Default bar; 1 - Custom bar; 2 - Custom animated bar.
            # -----------------------------------------------------------------
            :type     =>  0,
            :vertical =>  false,# Display vertically? True/False
            # Works for type 0 and 1.
            :ani_rate =>  0.02, # Max is 1.00. Refers to animate speed/rate.
            #---
            :type_0   =>  {
                # -----------------------------------------------------------------
                # Set the color for the bar background. [R,G,B,A]
                # You can also use normal_color to use the default windowskin colors.
                # -----------------------------------------------------------------
                :back_color =>  [0, 0, 0, 255],
                # -----------------------------------------------------------------
                # color1 = refers to the first color of the gradient. ([R,G,B,A])
                # color2 = refers to the second color of the gradient. ([R,G,B,A])
                # normal_color refers to the color of your default windowskin.
                # -----------------------------------------------------------------
                :color1     =>  [70, 10, 58, 255],
                :color2     =>  [84, 19, 144, 255],
                # -----------------------------------------------------------------
                # Set the outline color for the name display. [R,G,B,A]
                # You can also use normal_color to use the default outline color.
                # -----------------------------------------------------------------
                :outline    =>  [0, 0, 0, 255],
                :length     =>  50, # Width/Length of the bar.
                :height     =>  12,  # Height of the bar.

                # -----------------------------------------------------------------
                # This section allows you to customize the "EXP" Vocab display.
                # -----------------------------------------------------------------
                # -----------------------------------------------------------------
                # Offset Values refer to how much you want to nudge the window display
                # without affecting its base x, y and z.
                # -----------------------------------------------------------------
                :offset_x =>  0,
                :offset_y =>  0,
                :offset_z =>  1,
                # -----------------------------------------------------------------
                # Set the color for the name display. [R,G,B,A]
                # You can also use normal_color to use the default font color.
                # -----------------------------------------------------------------
                :tcolor   =>  [255, 255, 255, 255],
                # -----------------------------------------------------------------
                # Set the outline color for the name display. [R,G,B,A]
                # You can also use normal_color to use the default outline color.
                # -----------------------------------------------------------------
                :toutline =>  [0, 0, 0, 128],
                :bold     =>  false, # Enable Bold? True/False
                :italic   =>  false, # Enable Italic? True/False
                # -----------------------------------------------------------------
                # Set alignment settings.
                # 0 = Left/Default, 1 = Center, 2 = Right
                # -----------------------------------------------------------------
                :align    =>  0,
                :font     =>  "VL Gothic", # Set Font type.
                :size     =>  18,          # Set Font Size
                :text     =>  "TOX",        # Change "EXP" Vocab.
            },
            #---
            :type_1   =>  {
                :filename =>  "physbar-fill", # Custom HP Bar Filename.
            },
            #---
            :type_2   =>  {
                :filename =>  "Btskin_hp",	  # Custom Frame-based HP Bar Filename.
                :frames   =>  10,             # Amount of animation frames.
            },
        } # End toxicity_bar.
    }
    BATTLER_HUD = BATTLER_HUD.merge(BATTLER_HUD_tmp)
  end
end
#==============================================================================
# ? SpriteHUD_Bar
#==============================================================================

class SpriteHUD_Bar < Sprite

  #--------------------------------------------------------------------------
  # alias method: real_rate
  #--------------------------------------------------------------------------
  alias luna_real_rate real_rate
  def real_rate
    case @symbol
      when :toxicity_bar; return @battler.toxicity_rate
      else return luna_real_rate
    end
  end

end # SpriteMenu_Bar

class SpriteHUD_Numbers < Sprite


end # SpriteMenu_Bar

#==============================================================================
# ? Spriteset_HUD
#==============================================================================

class Spriteset_HUD
  #--------------------------------------------------------------------------
  # alias method: create_bars
  #--------------------------------------------------------------------------
  alias luna_create_bars create_bars
  def create_bars
    luna_create_bars
    tc_bar = SpriteHUD_Bar.new(@viewport, self, :toxicity_bar)
    @sprites.push(tc_bar)
  end

  #--------------------------------------------------------------------------
  # alias method: create_numbers
  #--------------------------------------------------------------------------
  alias luna_create_numbers create_numbers
  def create_numbers
    luna_create_numbers
    #SpriteHUD_Numbers.new(@viewport, self, :hp)
    tc = SpriteHUD_Numbers.new(@viewport, self, :toxicity)
    mtc = SpriteHUD_Numbers.new(@viewport, self, :max_toxicity)
    @sprites.push(tc, mtc)
  end
end

class SpriteHUD_Numbers < Sprite
  #--------------------------------------------------------------------------
  # alias method: update_rate
  #--------------------------------------------------------------------------
  alias luna_update_rate update_rate
  def update_rate
    case @symbol
      when :toxicity then
        rate = @battler.max_toxicity * setting[:ani_rate]
        max = @battler.max_toxicity
        rate = [(@number.to_i - real_number.to_i).abs, rate.ceil].min
        @number += @number > real_number ? -rate : rate
        number = @number.to_i
        refresh if rate > 0
        return unless setting[:with_max]
        refresh if max != @max_number
      else luna_update_rate
    end
  end

  #--------------------------------------------------------------------------
  # alias method: refresh_type0
  #--------------------------------------------------------------------------
  alias luna_refresh_type0 refresh_type0
  def refresh_type0
    case @symbol
      when :toxicity then
        @max_number = @battler.max_toxicity
        #---
        self.bitmap ||= Bitmap.new(setting_type[:width], setting_type[:height])
        self.bitmap.clear
        #---
        type = setting_type
        color = type[:color]
        out = type[:outline]
        if setting[:text]
          str = sprintf(setting[:text], @number, @max_number)
          str = setting[:with_max] ? str : @number
        else
          str = @number
        end
        self.bitmap = Bitmap.new(type[:width], type[:height])
        self.bitmap.font.name = type[:font]
        self.bitmap.font.size = type[:size]
        self.bitmap.font.bold = type[:bold]
        self.bitmap.font.italic = type[:italic]
        if color.is_a?(String)
          bitmap.font.color = eval(color)
        else
          bitmap.font.color = Color.new(color[0], color[1], color[2], color[3])
        end
        if out.is_a?(String)
          bitmap.font.out_color = eval(out)
        else
          bitmap.font.out_color = Color.new(out[0], out[1], out[2], out[3])
        end
        self.bitmap.draw_text(0, 0, self.bitmap.width, self.bitmap.height, str, type[:align])
      else luna_refresh_type0
    end
  end

  #--------------------------------------------------------------------------
  # refresh_type1
  #--------------------------------------------------------------------------
  #--------------------------------------------------------------------------
  # real_number
  #--------------------------------------------------------------------------
  alias luna_real_number real_number
  def real_number
    case @symbol
      when :toxicity; return @battler.toxicity
      when :max_toxicity; return @battler.max_toxicity
      else return luna_real_number
    end
  end

  #--------------------------------------------------------------------------
  # setting
  #--------------------------------------------------------------------------
  alias luna_setting setting
  def setting
    case @symbol
      when :toxicity; BattleLuna::HUD::BATTLER_HUD[:toxicity_num]
      when :max_toxicity; BattleLuna::HUD::BATTLER_HUD[:max_toxicity_num]
      else return luna_setting
    end
  end


end # Spriteset_MenuStatus
