#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
#_/    ? KGC_BitmapExtension ? XP/VX/VXA ?
#_/    ? Last update : 2009/09/13 ?
#_/----------------------------------------------------------------------------
#_/  Adding various drawing functions to the Bitmap Class
#_/ You can use this in both XP and VX
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

#==============================================================================
# ?  Customization BEGIN ?
#==============================================================================

module KGC
  module BitmapExtension
    # ? Action/movement mode of draw_text
    #   0 : draw_text (default)
    #   1 : draw_text_na
    #   2 : draw_text_fast
    # selecting 1 or 2, draw_text will be set to draw_text_na or draw_text_fast respectively.
    # you can call the original draw_text by _draw_text
    DEFAULT_MODE = 0

    # ? Default fonts of each mode
    #   [“Font1”, ”Font2”,…],
    #  Follow the above format to set fonts.
    DEFAULT_FONT_NAME = [
        Font.default_name,  # 0
        Font.default_name,  # 0
        Font.default_name,  # 2
    ]

    # ? Hemming using default
    #  Not effective on draw_text
    DEFAULT_FRAME = true

    # ? Default gradient colors
    #  Use “nil” if not using gradients
    #  Not effective on draw_text
    DEFAULT_GRAD_COLOR = nil
  end
end

#==============================================================================
# ? Customization END ?
#==============================================================================

=begin
????? Loading Method????????????????????????
???? Class - Bitmap ????????????????????????????
rop_blt(x, y, src_bitmap, src_rect[, rop])
  x, y       : The coordinates X,Y for drawing
  src_bitmap :  The Bitmap that you are to draw
  src_rect   : The transmission scope of src_bitmap
  rop        : Raster Operation Code
               SRCCOPY, SRCPAINT, SRCAND, SRCINVERT, SRCERASE,
               NOTSRCCOPY, NOTSRCERASE
               (default: SRCCOPY)

Uses Raster Operation to draw src_bitmap

--------------------------------------------------------------------------------
blend_blt(x, y, src_bitmap, src_rect[, blend_type])
  x, y       : The coordinates X,Y for drawing
  src_bitmap : The Bitmap that you are to draw
  src_rect   : The transmission scope of src_bitmap
  blend_type : Blending Type
               BLEND_NORMAL, BLEND_ADD, BLEND_SUB, BLEND_MUL, BLEND_HILIGHT
               (Default: BLEND_NORMAL)

Uses special blending types to draw scr_bitmap
--------------------------------------------------------------------------------
clip_blt(x, y, src_bitmap, src_rect, region)
  x, y       : The coordinates X,Y for drawing
  src_bitmap : The Bitmap that you are to draw
  src_rect   : The transmission scope of src_bitmap
  region     :  territory to perform clipping
Using Region to cut out, and to draw src_bitmap
--------------------------------------------------------------------------------
stretch_blt_r(dest_rect, src_bitmap, src_rect[, opacity])
  dest_rect  : rectangle area of the drawing area
  src_bitmap : The Bitmap that you are to draw
  src_rect   : The transmission scope of src_bitmap
  opacity    : Opacity (Default:255)

High resolution scale-up/down block transmission
--------------------------------------------------------------------------------
skew_blt(x, y, src_bitmap, src_rect, slope[, opacity])
  x, y       : The coordinates X,Y for drawing
  src_bitmap : The Bitmap that you are to draw
  src_rect   : The transmission scope of src_bitmap
  slope      : Slope (-90 ? 90)
  opacity    : Opacity (Default:255)

 Makes src_bitmap into a parallelogram
Will not perform interpolation processing.

--------------------------------------------------------------------------------
skew_blt_r(x, y, src_bitmap, src_rect, slope[, opacity])
  x, y       : The coordinates X,Y for drawing
  src_bitmap : The Bitmap that you are to draw
  src_rect   : The transmission scope of src_bitmap
  slope      : Slope (-90 ? 90)
  opacity    : Opacity (Default:255)

Makes src_bitmap into parallelogram
 Same interpolation processing as stretch_blt_r

--------------------------------------------------------------------------------
draw_polygon(points, color[, width])
  points : Coordinate list (each element [x,y])
  color  : Drawing color
  width  : line width (default: 1 )

 Draws a shape by connecting each coordinate
--------------------------------------------------------------------------------
fill_polygon(points, start_color, end_color)
  points      : Coordinate list (each element [x,y])
  start_color : Central (main) color
  end_color   : peripheral color

Fills a shape drawn by connecting each coordinate with color
--------------------------------------------------------------------------------
draw_regular_polygon(x, y, r, n, color[, width])
  x, y  : Central coordinate
  r     : radius of the circumscribed circle
  n     : number of vertices/apices
  color : drawing color
  width : line width (default: 1 )

 Draws a shape with n vertices inscribed within a circle with center x,y, radius r
--------------------------------------------------------------------------------
fill_regular_polygon(x, y, r, n, start_color, end_color)
    x, y  : Central coordinate
  r     : radius of the circumscribed circle
  n     : number of vertices/apices
  start_color : Central color
  end_color   : Peripheral color

Fills a shape with n vertices inscribed within a circle with center x,y, radius r
--------------------------------------------------------------------------------
draw_spoke(x, y, r, n, color[, width])
  x, y  : Central coordinate
  r     : radius of the circumscribed circle
  n     : number of vertices/apices
  color : drawing color
  width : line width (default: 1 )
Draws spoke for a circle centered at x,y, radius r
--------------------------------------------------------------------------------
draw_text_na(x, y, width, height, text[, align])
draw_text_na(rect, text[, align])
  x, y          : Coordinates for drawing
  width, height : Drawing size
  rect          : rectangle area of drawing
  text          : text
  align         : alignment (Default: 0)

Drawing text without anti-alias
--------------------------------------------------------------------------------
draw_text_fast(x, y, width, height, text[, align])
draw_text_fast(rect, text[, align])
x, y          : Coordinates for drawing
  width, height : Drawing size
  rect          : rectangle area of drawing
  text          : text
  align         : alignment (Default: 0)

 Drawing text with anti-alias quickly
--------------------------------------------------------------------------------
text_size_na(text)
  text : target text

Acquires the “Rect” rectangle made during drawing text through draw_text_na
--------------------------------------------------------------------------------
text_size_fast(text)
  text : target text
Acquires the “Rect” rectangle made during drawing text through draw_text_fast


--------------------------------------------------------------------------------
save(filename)
  filename : folder/place where you plan to save the file at

Saves as Bitmap file
Alpha Channel will be discarded.


????? Loading Class?????????????????????????
Region

Super Class of each region
--------------------------------------------------------------------------------
RectRegion < Region

    -  constructor  -
  (x, y, width, height)
  (rect)

    - public member -
  x, y, width, height : size and position of regtangle

Rectangular Region.
The rectangle that was set will become the drawing region.

--------------------------------------------------------------------------------
RoundRectRegion < RectRegion

    -  constructor-
  (x, y, width, height[, width_ellipse[, height_ellipse]])
    width_ellipse  : width of the roundness of the angle
    height_ellipse : height of the roundness of the angle
  (rect[, width_ellipse[, height_ellipse]])

    - public member -
public member of RectRegion
  width_ellipse, height_ellipse : Roundness of the angle

Round-cornered rectangular region
The rectangle with inputted values with round corners will become the drawing region.

--------------------------------------------------------------------------------
EllipticRegion < RectRegion

    -  constructor-
  (x, y, width, height)
  (rect)
    - public member -
  public member of RectRegion

?Elliptical Region
Draws an ellipse inscribed within the set rectangle

--------------------------------------------------------------------------------
CircularRegion < EllipticRegion

    - Constructor -
  (x, y, radius)
    x, y   : Central coordinates
    radius : radius

    - Public member-
  x, y, radius : center and radius

Circular Region
 Drawing area is the circle with the inputted center and radius

--------------------------------------------------------------------------------
PolygonRegion < Region

    - Constructor -
  (point1, point2, ...)
    point : Coordinates in the form [x,y]

    - Public member -
  points    : Coordinate list in the form [x,y]
  fill_mode : Fill mode of polygons
                ALTERNATE : Only the areas between odd and even line segments
                WINDING   : areas between all line segments
              Default is WINDING

Polygonal Region
 Creates a polygonal drawing area by connecting the coordinate list.

--------------------------------------------------------------------------------
StarRegion < PolygonRegion

    - Constructor -
  (x, y, width, height[, angle])
  (region[, angle])
    region : Rect, RectRegion, EllipticRegion, CircularRegion (One of these)
    angle  : Starting angle (Default:0)

    - Public member -
  fill_mode           : Same as in  PolygonRegion
  x, y, width, height : Rectangle set as the standard
  angle               : Rotation angle (0~359)

Star Region
a star shaped drawing area inscribed inside an oval inscribed inside the rectangle set as the standard.
Rotation is clockwise

--------------------------------------------------------------------------------
PieRegion < Region

    - Constructor -
  (region, start_angle, sweep_angle)
    region      : Standard CircularRegion
    start_angle : Starting angle
    sweep_angle : Drawing angle (-360 ? 360)

    - Public Member -
  x, y, radius : Center and Radius
  start_angle  : Starting angle
  sweep_angle  : Drawing angle (-360~360)

Fan-shaped region
Creates a fan-shaped (like a piece of pie) drawing region from the beginning angle in the standard circle to the drawing angle
Starting angle is clockwise originating from 0 in the rightward direction. You can also set negative numbers.

--------------------------------------------------------------------------------
CombinedRegion < Region

Combined Region
Can be created through the following formulae.

  r1 & r2
  r1 * r2
product of r1 and r2(takes common area of r1 and r2)

  r1 | r2
  r1 + r2
sum of r1 and r2 (takes up both r1 and r2)

  r1 ^ r2
Creates a Venn diagram and takes the overlapping area (Only takes the area in either region, not both)

  r1 - r2
difference between r1 and r2 (Deletes area of overlap between r1 and r2 from r1)

????????????????????????????????????????
=end

$imported = {} if $imported == nil
$imported["BitmapExtension"] = true

#???????????????????????????????????????

#==============================================================================
# ? TRGSSX
#------------------------------------------------------------------------------
#   "TRGSSX.dll" This module handles the functions described above.
#==============================================================================

module TRGSSX
  # Blending Options
  BLEND_NORMAL  = 0  # Normal
  BLEND_ADD     = 1  # Addition
  BLEND_SUB     = 2  # Subtraction
  BLEND_MUL     = 3  # Multiply
  BLEND_HILIGHT = 4  # Dodge Tool/Overlay

  # Raster Operation
  SRCCOPY     = 0x00CC0020  # dest = src
  SRCPAINT    = 0x00EE0086  # dest = dest | src
  SRCAND      = 0x008800C6  # dest = dest & src
  SRCINVERT   = 0x00660046  # dest = dest ^ src
  SRCERASE    = 0x00440328  # dest = dest & ~src
  NOTSRCCOPY  = 0x00330008  # dest = ~src
  NOTSRCERASE = 0x001100A6  # dest = ~(dest | src) = ~dest & ~src

  # Interpolation Method
  IM_INVALID             = -1
  IM_DEFAULT             = 0
  IM_LOWQUALITY          = 1
  IM_HIGHQUALITY         = 2
  IM_BILINEAR            = 3
  IM_BICUBIC             = 4
  IM_NEARESTNEIGHBOR     = 5
  IM_HIGHQUALITYBILINEAR = 6
  IM_HIGHQUALITYBICUBIC  = 7

  # Smoothing Mode
  SM_INVALID     = -1
  SM_DEFAULT     = 0
  SM_HIGHSPEED   = 1
  SM_HIGHQUALITY = 2
  SM_NONE        = 3
  SM_ANTIALIAS   = 4

  # Filing Mode
  FM_FIT    = 0  # ????
  FM_CIRCLE = 1  # Circle

  # Font Style
  FS_BOLD      = 0x0001  # Bold
  FS_ITALIC    = 0x0002  # Italic
  FS_UNDERLINE = 0x0004  # Underline
  FS_STRIKEOUT = 0x0008  # Strikeout
  FS_SHADOW    = 0x0010  # Shadow
  FS_FRAME     = 0x0020  # Outline

  DLL_NAME = 'TRGSSX'
  begin
    NO_TRGSSX = false
    unless defined?(@@_trgssx_version)
      @@_trgssx_version =
          Win32API.new(DLL_NAME, 'DllGetVersion', 'v', 'l')
      @@_trgssx_get_interpolation_mode =
          Win32API.new(DLL_NAME, 'GetInterpolationMode', 'v', 'l')
      @@_trgssx_set_interpolation_mode =
          Win32API.new(DLL_NAME, 'SetInterpolationMode', 'l', 'v')
      @@_trgssx_get_smoothing_mode =
          Win32API.new(DLL_NAME, 'GetSmoothingMode', 'v', 'l')
      @@_trgssx_set_smoothing_mode =
          Win32API.new(DLL_NAME, 'SetSmoothingMode', 'l', 'v')
      @@_trgssx_rop_blt =
          Win32API.new(DLL_NAME, 'RopBlt', 'pllllplll', 'l')
      @@_trgssx_clip_blt =
          Win32API.new(DLL_NAME, 'ClipBlt', 'pllllplll', 'l')
      @@_trgssx_blend_blt =
          Win32API.new(DLL_NAME, 'BlendBlt', 'pllllplll', 'l')
      @@_trgssx_stretch_blt_r =
          Win32API.new(DLL_NAME, 'StretchBltR', 'pllllplllll', 'l')
      @@_trgssx_skew_blt_r =
          Win32API.new(DLL_NAME, 'SkewBltR', 'pllpllllll', 'l')
      @@_trgssx_draw_polygon =
          Win32API.new(DLL_NAME, 'DrawPolygon', 'pplll', 'l')
      @@_trgssx_fill_polygon =
          Win32API.new(DLL_NAME, 'FillPolygon', 'ppllll', 'l')
      @@_trgssx_draw_regular_polygon =
          Win32API.new(DLL_NAME, 'DrawRegularPolygon', 'pllllll', 'l')
      @@_trgssx_fill_regular_polygon =
          Win32API.new(DLL_NAME, 'FillRegularPolygon', 'plllllll', 'l')
      @@_trgssx_draw_spoke =
          Win32API.new(DLL_NAME, 'DrawSpoke', 'pllllll', 'l')
      @@_trgssx_draw_text_na =
          Win32API.new(DLL_NAME, 'DrawTextNAA', 'pllllpplpll', 'l')
      @@_trgssx_draw_text_fast =
          Win32API.new(DLL_NAME, 'DrawTextFastA', 'pllllpplpll', 'l')
      @@_trgssx_get_text_size_na =
          Win32API.new(DLL_NAME, 'GetTextSizeNAA', 'pppllp', 'l')
      @@_trgssx_get_text_size_fast =
          Win32API.new(DLL_NAME, 'GetTextSizeFastA', 'pppllp', 'l')
      @@_trgssx_save_to_bitmap =
          Win32API.new(DLL_NAME, 'SaveToBitmapA', 'pp', 'l')
    end
  rescue
    NO_TRGSSX = true
    print "\"#{DLL_NAME}.dll\" is not found or" +
              "you are using an older version."
    exit
  end

  module_function
  #--------------------------------------------------------------------------
  # ? ???????
  #     (<?> 1.23 ? 123)
  #--------------------------------------------------------------------------
  def version
    return -1 if NO_TRGSSX

    return @@_trgssx_version.call
  end
  #--------------------------------------------------------------------------
  # ? GetInterpolationMode
  #--------------------------------------------------------------------------
  def get_interpolation_mode
    return @@_trgssx_get_interpolation_mode.call
  end
  #--------------------------------------------------------------------------
  # ? SetInterpolationMode
  #--------------------------------------------------------------------------
  def set_interpolation_mode(mode)
    @@_trgssx_set_interpolation_mode.call(mode)
  end
  #--------------------------------------------------------------------------
  # ? GetSmoothingMode
  #--------------------------------------------------------------------------
  def get_smoothing_mode
    return @@_trgssx_get_smoothing_mode.call
  end
  #--------------------------------------------------------------------------
  # ? SetSmoothingMode
  #--------------------------------------------------------------------------
  def set_smoothing_mode(mode)
    @@_trgssx_set_smoothing_mode.call(mode)
  end
  #--------------------------------------------------------------------------
  # ? BitBltRop
  #--------------------------------------------------------------------------
  def rop_blt(dest_info, dx, dy, dw, dh, src_info, sx, sy, rop)
    return @@_trgssx_rop_blt.call(dest_info, dx, dy, dw, dh,
                                  src_info, sx, sy, rop)
  end
  #--------------------------------------------------------------------------
  # ? ClipBlt
  #--------------------------------------------------------------------------
  def clip_blt(dest_info, dx, dy, dw, dh, src_info, sx, sy, hRgn)
    return @@_trgssx_clip_blt.call(dest_info, dx, dy, dw, dh,
                                   src_info, sx, sy, hRgn)
  end
  #--------------------------------------------------------------------------
  # ? BlendBlt
  #--------------------------------------------------------------------------
  def blend_blt(dest_info, dx, dy, dw, dh, src_info, sx, sy, blend)
    return @@_trgssx_blend_blt.call(dest_info, dx, dy, dw, dh,
                                    src_info, sx, sy, blend)
  end
  #--------------------------------------------------------------------------
  # ? StretchBltR
  #--------------------------------------------------------------------------
  def stretch_blt_r(dest_info, dx, dy, dw, dh, src_info, sx, sy, sw, sh, op)
    return @@_trgssx_stretch_blt_r.call(dest_info, dx, dy, dw, dh,
                                        src_info, sx, sy, sw, sh, op)
  end
  #--------------------------------------------------------------------------
  # ? SkewBltR
  #--------------------------------------------------------------------------
  def skew_blt_r(dest_info, dx, dy, src_info, sx, sy, sw, sh, slope, op)
    return @@_trgssx_skew_blt_r.call(dest_info, dx, dy,
                                     src_info, sx, sy, sw, sh, slope, op)
  end
  #--------------------------------------------------------------------------
  # ? DrawPolygon
  #--------------------------------------------------------------------------
  def draw_polygon(dest_info, pts, n, color, width)
    return @@_trgssx_draw_polygon.call(dest_info, pts,
                                       n, color, width)
  end
  #--------------------------------------------------------------------------
  # ? FillPolygon
  #--------------------------------------------------------------------------
  def fill_polygon(dest_info, pts, n, st_color, ed_color, fm)
    return @@_trgssx_fill_polygon.call(dest_info, pts,
                                       n, st_color, ed_color, fm)
  end
  #--------------------------------------------------------------------------
  # ? DrawRegularPolygon
  #--------------------------------------------------------------------------
  def draw_regular_polygon(dest_info, dx, dy, r, n, color, width)
    return @@_trgssx_draw_regular_polygon.call(dest_info, dx, dy,
                                               r, n, color, width)
  end
  #--------------------------------------------------------------------------
  # ? FillRegularPolygon
  #--------------------------------------------------------------------------
  def fill_regular_polygon(dest_info, dx, dy, r, n, st_color, ed_color, fm)
    return @@_trgssx_fill_regular_polygon.call(dest_info, dx, dy,
                                               r, n, st_color, ed_color, fm)
  end
  #--------------------------------------------------------------------------
  # ? DrawSpoke
  #--------------------------------------------------------------------------
  def draw_spoke(dest_info, dx, dy, r, n, color, width)
    return @@_trgssx_draw_spoke.call(dest_info, dx, dy,
                                     r, n, color, width)
  end
  #--------------------------------------------------------------------------
  # ? DrawTextNAA
  #--------------------------------------------------------------------------
  def draw_text_na(dest_info, dx, dy, dw, dh, text,
                   fontname, fontsize, color, align, flags)
    return @@_trgssx_draw_text_na.call(dest_info, dx, dy, dw, dh, text.dup,
                                       fontname, fontsize, color, align, flags)
  end
  #--------------------------------------------------------------------------
  # ? DrawTextFastA
  #--------------------------------------------------------------------------
  def draw_text_fast(dest_info, dx, dy, dw, dh, text,
                     fontname, fontsize, color, align, flags)
    return @@_trgssx_draw_text_fast.call(dest_info, dx, dy, dw, dh, text.dup,
                                         fontname, fontsize, color, align, flags)
  end
  #--------------------------------------------------------------------------
  # ? GetTextSizeNAA
  #--------------------------------------------------------------------------
  def get_text_size_na(dest_info, text, fontname, fontsize, flags, size)
    return @@_trgssx_get_text_size_na.call(dest_info, text,
                                           fontname, fontsize, flags, size)
  end
  #--------------------------------------------------------------------------
  # ? GetTextSizeFastA
  #--------------------------------------------------------------------------
  def get_text_size_fast(dest_info, text, fontname, fontsize, flags, size)
    return @@_trgssx_get_text_size_fast.call(dest_info, text,
                                             fontname, fontsize, flags, size)
  end
  #--------------------------------------------------------------------------
  # ? SaveToBitmapA
  #--------------------------------------------------------------------------
  def save_to_bitmap(filename, info)
    return @@_trgssx_save_to_bitmap.call(filename, info)
  end
end

#???????????????????????????????????????

#==============================================================================
# ? Bitmap
#==============================================================================

class Bitmap
  #--------------------------------------------------------------------------
  # ? ???????
  #--------------------------------------------------------------------------
  def self.interpolation_mode
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.get_interpolation_mode
  end
  #--------------------------------------------------------------------------
  # ? ???????
  #--------------------------------------------------------------------------
  def self.interpolation_mode=(value)
    return if TRGSSX::NO_TRGSSX

    TRGSSX.set_interpolation_mode(value)
  end
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def self.smoothing_mode
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.get_smoothing_mode
  end
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def self.smoothing_mode=(value)
    return if TRGSSX::NO_TRGSSX

    TRGSSX.set_smoothing_mode(value)
  end
  #--------------------------------------------------------------------------
  # ? ???????? (object_id, width, height) ? pack ???
  #--------------------------------------------------------------------------
  def get_base_info
    return [object_id, width, height].pack('l!3')
  end
  #--------------------------------------------------------------------------
  # ? ?????????????????
  #     rop : ?????????????
  #--------------------------------------------------------------------------
  def rop_blt(x, y, src_bitmap, src_rect, rop = TRGSSX::SRCCOPY)
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.rop_blt(get_base_info,
                          x, y, src_rect.width, src_rect.height,
                          src_bitmap.get_base_info, src_rect.x, src_rect.y, rop)
  end
  #--------------------------------------------------------------------------
  # ? ????????
  #     region : ?????
  #--------------------------------------------------------------------------
  def clip_blt(x, y, src_bitmap, src_rect, region)
    return -1 if TRGSSX::NO_TRGSSX

    hRgn = region.create_region_handle
    return if hRgn == nil || hRgn == 0

    result = TRGSSX.clip_blt(get_base_info,
                             x, y, src_rect.width, src_rect.height,
                             src_bitmap.get_base_info, src_rect.x, src_rect.y, hRgn)
    # ???
    Region.delete_region_handles

    return result
  end
  #--------------------------------------------------------------------------
  # ? ??????
  #     blend : ???????
  #--------------------------------------------------------------------------
  def blend_blt(x, y, src_bitmap, src_rect, blend = TRGSSX::BLEND_NORMAL)
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.blend_blt(get_base_info,
                            x, y, src_rect.width, src_rect.height,
                            src_bitmap.get_base_info, src_rect.x, src_rect.y, blend)
  end
  #--------------------------------------------------------------------------
  # ? ?????????
  #--------------------------------------------------------------------------
  def stretch_blt_r(dest_rect, src_bitmap, src_rect, opacity = 255)
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.stretch_blt_r(get_base_info,
                                dest_rect.x, dest_rect.y, dest_rect.width, dest_rect.height,
                                src_bitmap.get_base_info,
                                src_rect.x, src_rect.y, src_rect.width, src_rect.height,
                                opacity)
  end
  #--------------------------------------------------------------------------
  # ? ???????
  #--------------------------------------------------------------------------
  def skew_blt(x, y, src_bitmap, src_rect, slope, opacity = 255)
    slope = [[slope, -89].max, 89].min
    sh    = src_rect.height
    off  = sh / Math.tan(Math::PI * (90 - slope.abs) / 180.0)
    if slope >= 0
      dx   = x + off.to_i
      diff = -off / sh
    else
      dx   = x
      diff = off / sh
    end
    rect = Rect.new(src_rect.x, src_rect.y, src_rect.width, 1)

    sh.times { |i|
      blt(dx + (diff * i).round, y + i, src_bitmap, rect, opacity)
      rect.y += 1
    }
  end
  #--------------------------------------------------------------------------
  # ? ??????????
  #--------------------------------------------------------------------------
  def skew_blt_r(x, y, src_bitmap, src_rect, slope, opacity = 255)
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.skew_blt_r(get_base_info,
                             x, y, src_bitmap.get_base_info,
                             src_rect.x, src_rect.y, src_rect.width, src_rect.height,
                             slope, opacity)
  end
  #--------------------------------------------------------------------------
  # ? ?????
  #--------------------------------------------------------------------------
  def draw_polygon(points, color, width = 1)
    return -1 if TRGSSX::NO_TRGSSX

    _points = create_point_pack(points)

    return TRGSSX.draw_polygon(get_base_info,
                               _points, points.size, color.argb_code, width)
  end
  #--------------------------------------------------------------------------
  # ? ???????
  #--------------------------------------------------------------------------
  def fill_polygon(points, st_color, ed_color, fill_mode = TRGSSX::FM_FIT)
    return -1 if TRGSSX::NO_TRGSSX

    _points = create_point_pack(points)

    return TRGSSX.fill_polygon(get_base_info,
                               _points, points.size, st_color.argb_code, ed_color.argb_code, fill_mode)
  end
  #--------------------------------------------------------------------------
  # ? ?????? pack ???
  #--------------------------------------------------------------------------
  def create_point_pack(points)
    result = ''
    points.each { |pt| result += pt.pack('l!2') }
    return result
  end
  private :create_point_pack
  #--------------------------------------------------------------------------
  # ? ??????
  #--------------------------------------------------------------------------
  def draw_regular_polygon(x, y, r, n, color, width = 1)
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.draw_regular_polygon(get_base_info,
                                       x, y, r, n, color.argb_code, width)
  end
  #--------------------------------------------------------------------------
  # ? ????????
  #--------------------------------------------------------------------------
  def fill_regular_polygon(x, y, r, n, st_color, ed_color,
                           fill_mode = TRGSSX::FM_FIT)
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.fill_regular_polygon(get_base_info,
                                       x, y, r, n, st_color.argb_code, ed_color.argb_code, fill_mode)
  end
  #--------------------------------------------------------------------------
  # ? ??????
  #--------------------------------------------------------------------------
  def draw_spoke(x, y, r, n, color, width = 1)
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.draw_spoke(get_base_info,
                             x, y, r, n, color.argb_code, width)
  end
  #--------------------------------------------------------------------------
  # ? ????????????????
  #--------------------------------------------------------------------------
  def draw_text_na(*args)
    return -1 if TRGSSX::NO_TRGSSX

    x, y, width, height, text, align = get_text_args(args)
    fname = get_available_font_name
    flags = get_draw_text_flags

    return TRGSSX.draw_text_na(get_base_info, x, y, width, height, text,
                               fname, font.size, get_text_color, align, flags)
  end
  #--------------------------------------------------------------------------
  # ? ????????
  #--------------------------------------------------------------------------
  def draw_text_fast(*args)
    return -1 if TRGSSX::NO_TRGSSX

    x, y, width, height, text, align = get_text_args(args)
    fname = get_available_font_name
    flags = get_draw_text_flags

    return TRGSSX.draw_text_fast(get_base_info, x, y, width, height, text,
                                 fname, font.size, get_text_color, align, flags)
  end
  #--------------------------------------------------------------------------
  # ? ??????? (na)
  #--------------------------------------------------------------------------
  def text_size_na(text)
    return -1 if TRGSSX::NO_TRGSSX

    fname = get_available_font_name
    flags = get_draw_text_flags
    size  = [0, 0].pack('l!2')

    result = TRGSSX.get_text_size_na(get_base_info, text.to_s,
                                     fname, font.size, flags, size)

    size = size.unpack('l!2')
    rect = Rect.new(0, 0, size[0], size[1])
    return rect
  end
  #--------------------------------------------------------------------------
  # ? ??????? (fast)
  #--------------------------------------------------------------------------
  def text_size_fast(text)
    return -1 if TRGSSX::NO_TRGSSX

    fname = get_available_font_name
    flags = get_draw_text_flags
    size  = [0, 0].pack('l!2')

    result = TRGSSX.get_text_size_fast(get_base_info, text.to_s,
                                       fname, font.size, flags, size)

    size = size.unpack('l!2')
    rect = Rect.new(0, 0, size[0], size[1])
    return rect
  end
  #--------------------------------------------------------------------------
  # ? ???????
  #--------------------------------------------------------------------------
  def get_text_args(args)
    if args[0].is_a?(Rect)
      # ??
      if args.size.between?(2, 4)
        x, y = args[0].x, args[0].y
        width, height = args[0].width, args[0].height
        text  = args[1].to_s
        align = (args[2].equal?(nil) ? 0 : args[2])
      else
        raise(ArgumentError,
              "wrong number of arguments(#{args.size} of #{args.size < 2 ? 2 : 4})")
        return
      end
    else
      # ??
      if args.size.between?(5, 7)
        x, y, width, height = args
        text  = args[4].to_s
        align = (args[5].equal?(nil) ? 0 : args[5])
      else
        raise(ArgumentError,
              "wrong number of arguments(#{args.size} of #{args.size < 5 ? 5 : 7})")
        return
      end
    end
    return [x, y, width, height, text, align]
  end
  private :get_text_args
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def get_available_font_name
    if font.name.is_a?(Array)
      font.name.each { |f|
        return f if Font.exist?(f)
      }
      return nil
    else
      return font.name
    end
  end
  private :get_available_font_name
  #--------------------------------------------------------------------------
  # ? ??? (main, gradation, shadow, needGrad) ? pack ???
  #--------------------------------------------------------------------------
  def get_text_color
    need_grad = !font.gradation_color.equal?(nil)
    result = []
    result << font.color.argb_code
    result << (need_grad ? font.gradation_color.argb_code : 0)
    result << 0xFF000000
    result << (need_grad ? 1 : 0)
    return result.pack('l!4')
  end
  private :get_text_color
  #--------------------------------------------------------------------------
  # ? ????????????
  #--------------------------------------------------------------------------
  def get_draw_text_flags
    flags  = 0
    flags |= TRGSSX::FS_BOLD   if font.bold
    flags |= TRGSSX::FS_ITALIC if font.italic
    flags |= TRGSSX::FS_SHADOW if font.shadow && !font.frame
    flags |= TRGSSX::FS_FRAME  if font.frame
    return flags
  end
  private :get_draw_text_flags
  #--------------------------------------------------------------------------
  # ? ??
  #     filename : ???
  #--------------------------------------------------------------------------
  def save(filename)
    return -1 if TRGSSX::NO_TRGSSX

    return TRGSSX.save_to_bitmap(filename, get_base_info)
  end
end

#???????????????????????????????????????

#==============================================================================
# ? Color
#==============================================================================

class Color
  #--------------------------------------------------------------------------
  # ? ARGB ?????
  #--------------------------------------------------------------------------
  def argb_code
    n  = 0
    n |= alpha.to_i << 24
    n |= red.to_i   << 16
    n |= green.to_i <<  8
    n |= blue.to_i
    return n
  end
end

#???????????????????????????????????????

#==============================================================================
# ? Font
#==============================================================================

class Font
  unless const_defined?(:XP_MODE)
    # XP ????
    unless method_defined?(:shadow)
      XP_MODE = true
      @@default_shadow = false
      attr_writer :shadow
      def self.default_shadow
        return @@default_shadow
      end
      def self.default_shadow=(s)
        @@default_shadow = s
      end
      def shadow
        return (@shadow == nil ? @@default_shadow : @shadow)
      end
    else
      XP_MODE = false
    end
  end
  #--------------------------------------------------------------------------
  # ? ?????
  #--------------------------------------------------------------------------
  @@default_frame           = KGC::BitmapExtension::DEFAULT_FRAME
  @@default_gradation_color = KGC::BitmapExtension::DEFAULT_GRAD_COLOR
  #--------------------------------------------------------------------------
  # ? ??????????
  #--------------------------------------------------------------------------
  attr_accessor :gradation_color
  #--------------------------------------------------------------------------
  # ? ?????????
  #--------------------------------------------------------------------------
  unless private_method_defined?(:initialize_KGC_BitmapExtension)
    alias initialize_KGC_BitmapExtension initialize
  end
  def initialize(name = Font.default_name, size = Font.default_size)
    initialize_KGC_BitmapExtension(name, size)

    @frame = nil
    @gradation_color = @@default_gradation_color
    if XP_MODE
      @shadow = nil
    end
  end
  #--------------------------------------------------------------------------
  # ? ?????????????
  #--------------------------------------------------------------------------
  def self.default_frame
    return @@default_frame
  end
  #--------------------------------------------------------------------------
  # ? ?????????????
  #--------------------------------------------------------------------------
  def self.default_frame=(value)
    @@default_frame = value
  end
  #--------------------------------------------------------------------------
  # ? ???????????????
  #--------------------------------------------------------------------------
  def self.default_gradation_color
    return @@default_gradation_color
  end
  #--------------------------------------------------------------------------
  # ? ???????????????
  #--------------------------------------------------------------------------
  def self.default_gradation_color=(value)
    @@default_gradation_color = value
  end
  #--------------------------------------------------------------------------
  # ? ????????
  #--------------------------------------------------------------------------
  unless method_defined?(:shadow_eq) || XP_MODE
    alias shadow_eq shadow=
  end
  def shadow=(value)
    XP_MODE ? @shadow = value : shadow_eq(value)
  end
  #--------------------------------------------------------------------------
  # ? ????????
  #--------------------------------------------------------------------------
  def frame
    return (@frame == nil ? @@default_frame : @frame)
  end
  #--------------------------------------------------------------------------
  # ? ????????
  #--------------------------------------------------------------------------
  def frame=(value)
    @frame = value
  end
end

#???????????????????????????????????????

#==============================================================================
# ? Region
#------------------------------------------------------------------------------
#   ??????????????????????
#==============================================================================

class Region
  #--------------------------------------------------------------------------
  # ? ?????
  #--------------------------------------------------------------------------
  @@handles = []  # ?????????????
  #--------------------------------------------------------------------------
  # ? Win32API
  #--------------------------------------------------------------------------
  @@_api_delete_object = Win32API.new('gdi32', 'DeleteObject', 'l', 'l')
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def create_region_handle
    # ???????
    return 0
  end
  #--------------------------------------------------------------------------
  # ? AND (&)
  #--------------------------------------------------------------------------
  def &(obj)
    return nil unless obj.is_a?(Region)
    return CombinedRegion.new(CombinedRegion::RGN_AND, self, obj)
  end
  #--------------------------------------------------------------------------
  # ? AND (*)
  #--------------------------------------------------------------------------
  def *(obj)
    return self.&(obj)
  end
  #--------------------------------------------------------------------------
  # ? OR (|)
  #--------------------------------------------------------------------------
  def |(obj)
    return nil unless obj.is_a?(Region)
    return CombinedRegion.new(CombinedRegion::RGN_OR, self, obj)
  end
  #--------------------------------------------------------------------------
  # ? OR (+)
  #--------------------------------------------------------------------------
  def +(obj)
    return self.|(obj)
  end
  #--------------------------------------------------------------------------
  # ? XOR (^)
  #--------------------------------------------------------------------------
  def ^(obj)
    return nil unless obj.is_a?(Region)
    return CombinedRegion.new(CombinedRegion::RGN_XOR, self, obj)
  end
  #--------------------------------------------------------------------------
  # ? DIFF (-)
  #--------------------------------------------------------------------------
  def -(obj)
    return nil unless obj.is_a?(Region)
    return CombinedRegion.new(CombinedRegion::RGN_DIFF, self, obj)
  end

  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def self.delete_region_handles
    @@handles.uniq!
    @@handles.each { |h| @@_api_delete_object.call(h) }
    @@handles.clear
  end
end

#???????????????????????????????????????

#==============================================================================
# ? RectRegion
#------------------------------------------------------------------------------
#   ????????????????
#==============================================================================

class RectRegion < Region
  #--------------------------------------------------------------------------
  # ? ??????????
  #--------------------------------------------------------------------------
  attr_accessor :x               # X ??
  attr_accessor :y               # Y ??
  attr_accessor :width           # ?
  attr_accessor :height          # ??
  #--------------------------------------------------------------------------
  # ? Win32API
  #--------------------------------------------------------------------------
  @@_api_create_rect_rgn = Win32API.new('gdi32',
                                        'CreateRectRgn', 'llll', 'l')
  @@_api_create_rect_rgn_indirect = Win32API.new('gdi32',
                                                 'CreateRectRgnIndirect', 'l', 'l')
  #--------------------------------------------------------------------------
  # ? ?????????
  #--------------------------------------------------------------------------
  def initialize(*args)
    if args[0].is_a?(Rect)
      rect = args[0]
      @x = rect.x
      @y = rect.y
      @width  = rect.width
      @height = rect.height
    else
      @x, @y, @width, @height = args
    end
  end
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def create_region_handle
    hRgn = @@_api_create_rect_rgn.call(@x, @y, @x + @width, @y + @height)
    @@handles << hRgn
    return hRgn
  end
end

#???????????????????????????????????????

#==============================================================================
# ? RoundRectRegion
#------------------------------------------------------------------------------
#   ??????????????????
#==============================================================================

class RoundRectRegion < RectRegion
  #--------------------------------------------------------------------------
  # ? ??????????
  #--------------------------------------------------------------------------
  attr_accessor :width_ellipse   # ????
  attr_accessor :height_ellipse  # ?????
  #--------------------------------------------------------------------------
  # ? Win32API
  #--------------------------------------------------------------------------
  @@_api_create_round_rect_rgn = Win32API.new('gdi32',
                                              'CreateRoundRectRgn', 'llllll', 'l')
  #--------------------------------------------------------------------------
  # ? ?????????
  #--------------------------------------------------------------------------
  def initialize(*args)
    super
    if args[0].is_a?(Rect)
      @width_ellipse  = args[1]
      @height_ellipse = args[2]
    else
      @width_ellipse  = args[4]
      @height_ellipse = args[5]
    end
  end
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def create_region_handle
    hRgn = @@_api_create_round_rect_rgn.call(@x, @y, @x + @width, @y + @height,
                                             width_ellipse, height_ellipse)
    @@handles << hRgn
    return hRgn
  end
end

#???????????????????????????????????????

#==============================================================================
# ? EllipticRegion
#------------------------------------------------------------------------------
#   ?????????????????
#==============================================================================

class EllipticRegion < RectRegion
  #--------------------------------------------------------------------------
  # ? Win32API
  #--------------------------------------------------------------------------
  @@_api_create_elliptic_rgn = Win32API.new('gdi32',
                                            'CreateEllipticRgn', 'llll', 'l')
  @@_api_create_elliptic_rgn_indirect = Win32API.new('gdi32',
                                                     'CreateEllipticRgnIndirect', 'l', 'l')
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def create_region_handle
    hRgn = @@_api_create_elliptic_rgn.call(@x, @y, @x + @width, @y + @height)
    @@handles << hRgn
    return hRgn
  end
end

#???????????????????????????????????????

#==============================================================================
# ? CircularRegion
#------------------------------------------------------------------------------
#   ????????????????
#==============================================================================

class CircularRegion < EllipticRegion
  #--------------------------------------------------------------------------
  # ? ??????????
  #--------------------------------------------------------------------------
  attr_reader   :radius  # ??
  #--------------------------------------------------------------------------
  # ? ?????????
  #--------------------------------------------------------------------------
  def initialize(x, y, r)
    @cx = x
    @cy = y
    self.radius = r
    super(@cx - r, @cy - r, r * 2, r * 2)
  end
  #--------------------------------------------------------------------------
  # ? ?? X ????
  #--------------------------------------------------------------------------
  def x
    return @cx
  end
  #--------------------------------------------------------------------------
  # ? ?? Y ????
  #--------------------------------------------------------------------------
  def y
    return @cy
  end
  #--------------------------------------------------------------------------
  # ? ?? X ????
  #--------------------------------------------------------------------------
  def x=(value)
    @cx = value
    @x = @cx - @radius
  end
  #--------------------------------------------------------------------------
  # ? ?? Y ????
  #--------------------------------------------------------------------------
  def y=(value)
    @cy = value
    @y = @cy - @radius
  end
  #--------------------------------------------------------------------------
  # ? ????
  #--------------------------------------------------------------------------
  def radius=(value)
    @radius = value
    @x = @cx - @radius
    @y = @cy - @radius
    @width = @height = @radius * 2
  end
end

#???????????????????????????????????????

#==============================================================================
# ? PolygonRegion
#------------------------------------------------------------------------------
#   ?????????????????
#==============================================================================

class PolygonRegion < Region
  #--------------------------------------------------------------------------
  # ? ??
  #--------------------------------------------------------------------------
  # ???????
  ALTERNATE = 1  # ?????
  WINDING   = 2  # ?????
  #--------------------------------------------------------------------------
  # ? ??????????
  #--------------------------------------------------------------------------
  attr_accessor :points     # ???? [x, y] ???
  attr_accessor :fill_mode  # ???????
  #--------------------------------------------------------------------------
  # ? Win32API
  #--------------------------------------------------------------------------
  @@_api_create_polygon_rgn = Win32API.new('gdi32',
                                           'CreatePolygonRgn', 'pll', 'l')
  @@_api_create_polypolygon_rgn = Win32API.new('gdi32',
                                               'CreatePolyPolygonRgn', 'llll', 'l')
  #--------------------------------------------------------------------------
  # ? ?????????
  #--------------------------------------------------------------------------
  def initialize(*points)
    @points = points  # [x, y] ???
    @fill_mode = WINDING
  end
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def create_region_handle
    pts = ""
    points.each { |pt| pts += pt.pack("ll") }
    hRgn = @@_api_create_polygon_rgn.call(pts, points.size, fill_mode)
    @@handles << hRgn
    return hRgn
  end
end

#???????????????????????????????????????

#==============================================================================
# ? StarRegion
#------------------------------------------------------------------------------
#   ????????????????
#==============================================================================

class StarRegion < PolygonRegion
  #--------------------------------------------------------------------------
  # ? ??
  #--------------------------------------------------------------------------
  POINT_NUM = 5               # ??
  PI_4      = 4.0 * Math::PI  # 4 * Pi
  #--------------------------------------------------------------------------
  # ? ??????????
  #--------------------------------------------------------------------------
  attr_reader   :x               # X ??
  attr_reader   :y               # Y ??
  attr_reader   :width           # ?
  attr_reader   :height          # ??
  attr_reader   :angle           # ???? (0 ? 359)
  #--------------------------------------------------------------------------
  # ? ?????????
  #--------------------------------------------------------------------------
  def initialize(*args)
    super()
    shape = args[0]
    ang = args[1]
    case shape
      when CircularRegion
        @x = shape.x - shape.radius
        @y = shape.y - shape.radius
        @width = @height = shape.radius * 2
      when Rect, RectRegion, EllipticRegion
        @x = shape.x
        @y = shape.y
        @width  = shape.width
        @height = shape.height
      when Integer
        @x, @y, @width, @height = args
        ang = args[4]
      else
        @x = @y = @width = @height = 0
    end
    @angle = (ang == nil ? 0 : ang % 360)
    @__init = true
    @points = create_star_points
  end
  #--------------------------------------------------------------------------
  # ? ???????
  #--------------------------------------------------------------------------
  def create_star_points
    return unless @__init

    dw = (width + 1) / 2
    dh = (height + 1) / 2
    dx = x + dw
    dy = y + dh
    base_angle = angle * Math::PI / 180.0
    pts = []
    POINT_NUM.times { |i|
      ang = base_angle + PI_4 * i / POINT_NUM
      pts << [dx + (Math.sin(ang) * dw).to_i,
              dy - (Math.cos(ang) * dh).to_i]
    }
    return pts
  end
  #--------------------------------------------------------------------------
  # ? X ????
  #--------------------------------------------------------------------------
  def x=(value)
    @x = value
    @points = create_star_points
  end
  #--------------------------------------------------------------------------
  # ? Y ????
  #--------------------------------------------------------------------------
  def y=(value)
    @y = value
    @points = create_star_points
  end
  #--------------------------------------------------------------------------
  # ? ???
  #--------------------------------------------------------------------------
  def width=(value)
    @width = value
    @points = create_star_points
  end
  #--------------------------------------------------------------------------
  # ? ??????
  #--------------------------------------------------------------------------
  def height=(value)
    @height = value
    @points = create_star_points
  end
  #--------------------------------------------------------------------------
  # ? ??????
  #--------------------------------------------------------------------------
  def angle=(value)
    @angle = value % 360
    @points = create_star_points
  end
end

#???????????????????????????????????????

#==============================================================================
# ? PieRegion
#------------------------------------------------------------------------------
#   ????????????????
#==============================================================================

class PieRegion < Region
  #--------------------------------------------------------------------------
  # ? ??
  #--------------------------------------------------------------------------
  HALF_PI = Math::PI / 2.0  # PI / 2
  #--------------------------------------------------------------------------
  # ? ??????????
  #--------------------------------------------------------------------------
  attr_reader   :begin_angle     # ???? [degree]
  attr_reader   :sweep_angle     # ???? (0 ? 359)
  #--------------------------------------------------------------------------
  # ? ?????????
  #--------------------------------------------------------------------------
  def initialize(*args)
    super()
    shape = args[0]
    ang1, ang2 = args[1..2]
    case shape
      when CircularRegion
        @cx = shape.x
        @cy = shape.y
        self.radius = shape.radius
      else
        @cx = @cy = @x = @y = @radius = 0
    end
    self.start_angle = (ang1 == nil ? 0 : ang1)
    self.sweep_angle = (ang2 == nil ? 0 : ang2)
    @__init = true
    create_pie_region
  end
  #--------------------------------------------------------------------------
  # ? ??????????
  #--------------------------------------------------------------------------
  def create_pie_region
    return unless @__init

    # ???????
    st_deg = @start_angle += (@sweep_angle < 0 ? @sweep_angle : 0)
    st_deg %= 360
    ed_deg = st_deg + @sweep_angle.abs
    diff = st_deg % 90
    r = @radius * 3 / 2
    s = st_deg / 90
    e = ed_deg / 90

    # ???????
    @region = nil
    (s..e).each { |i|
      break if i * 90 >= ed_deg
      if diff > 0
        st_rad = (i * 90 + diff) * Math::PI / 180.0
        diff = 0
      else
        st_rad = i * HALF_PI
      end
      if (i + 1) * 90 > ed_deg
        ed_rad = ed_deg * Math::PI / 180.0
      else
        ed_rad = (i + 1) * HALF_PI
      end
      pt1 = [@cx, @cy]
      pt2 = [
          @cx + Integer(Math.cos(st_rad) * r),
          @cy + Integer(Math.sin(st_rad) * r)
      ]
      pt3 = [
          @cx + Integer(Math.cos(ed_rad) * r),
          @cy + Integer(Math.sin(ed_rad) * r)
      ]
      rgn = PolygonRegion.new(pt1, pt2, pt3)
      if @region == nil
        @region = rgn
      else
        @region |= rgn
      end
    }
    @region &= CircularRegion.new(@cx, @cy, @radius)

    return @region
  end
  #--------------------------------------------------------------------------
  # ? ?? X ????
  #--------------------------------------------------------------------------
  def x
    return @cx
  end
  #--------------------------------------------------------------------------
  # ? ?? Y ????
  #--------------------------------------------------------------------------
  def y
    return @cy
  end
  #--------------------------------------------------------------------------
  # ? ?? X ????
  #--------------------------------------------------------------------------
  def x=(value)
    @cx = value
    @x = @cx - @radius
    create_pie_region
  end
  #--------------------------------------------------------------------------
  # ? ?? Y ????
  #--------------------------------------------------------------------------
  def y=(value)
    @cy = value
    @y = @cy - @radius
    create_pie_region
  end
  #--------------------------------------------------------------------------
  # ? ????
  #--------------------------------------------------------------------------
  def radius=(value)
    @radius = value
    @x = @cx - @radius
    @y = @cy - @radius
    create_pie_region
  end
  #--------------------------------------------------------------------------
  # ? ??????
  #--------------------------------------------------------------------------
  def start_angle=(value)
    @start_angle = value
    create_pie_region
  end
  #--------------------------------------------------------------------------
  # ? ??????
  #--------------------------------------------------------------------------
  def sweep_angle=(value)
    @sweep_angle = [[value, -360].max, 360].min
    create_pie_region
  end
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def create_region_handle
    return @region.create_region_handle
  end
end

#???????????????????????????????????????

#==============================================================================
# ? CombinedRegion
#------------------------------------------------------------------------------
#   ????????????????
#==============================================================================

class CombinedRegion < Region
  #--------------------------------------------------------------------------
  # ? ??
  #--------------------------------------------------------------------------
  # ?????
  RGN_AND  = 1
  RGN_OR   = 2
  RGN_XOR  = 3
  RGN_DIFF = 4
  RGN_COPY = 5
  #--------------------------------------------------------------------------
  # ? Win32API
  #--------------------------------------------------------------------------
  @@_api_combine_rgn = Win32API.new('gdi32', 'CombineRgn', 'llll', 'l')
  #--------------------------------------------------------------------------
  # ? ?????????
  #--------------------------------------------------------------------------
  def initialize(mode, region1, region2)
    @exp = CombinedRegionExp.new(mode, region1.clone, region2.clone)
  end
  #--------------------------------------------------------------------------
  # ? ???????????
  #--------------------------------------------------------------------------
  def create_region_handle
    return combine_region(@exp.region1, @exp.region2, @exp.mode)
  end
  #--------------------------------------------------------------------------
  # ? ???????
  #     dest : ???
  #     src  : ???
  #     mode : ?????
  #--------------------------------------------------------------------------
  def combine_region(dest, src, mode)
    hdest = dest.create_region_handle
    hsrc  = src.create_region_handle
    @@_api_combine_rgn.call(hdest, hdest, hsrc, mode)
    return hdest
  end
  protected :combine_region
end

#???????????????????????????????????????

#==============================================================================
# ? Struct
#==============================================================================

# ? CombinedRegionExp ???
CombinedRegionExp = Struct.new("CombinedRegionExp", :mode, :region1, :region2)

#???????????????????????????????????????

class Bitmap
  unless method_defined?(:_draw_text)
    alias _draw_text draw_text
    alias _text_size text_size

    case KGC::BitmapExtension::DEFAULT_MODE
      when 1  # na
        alias draw_text draw_text_na
        alias text_size text_size_na
      when 2  # fast
        alias draw_text draw_text_fast
        alias text_size text_size_fast
    end
  end
end

Font.default_name = KGC::BitmapExtension::DEFAULT_FONT_NAME[
    KGC::BitmapExtension::DEFAULT_MODE]
