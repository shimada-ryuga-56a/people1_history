class OgpCreator
  require 'mini_magick'
  BASE_IMAGE_PATH = './app/assets/images/dynamic_ogp_background.jpeg'
  FONT = './app/assets/fonts/DotGothic16,M_PLUS_1p/DotGothic16/DotGothic16-Regular.ttf'
  GRAVITY = 'NorthWest'
  LONG_TEXT_FONT_SIZE = 25
  NORMAL_FONT_SIZE = 35
  TEXT_POSITION = '+70+97'
  TEXT_SHADOW_POSITION = '+68+100'
  SUB_FONT_SIZE = 15
  SUB_TEXT_POSITION = '+70+60'
  SUB_TEXT_SHADOW_POSITION = '+68+63'
  REMARK_FONT_SIZE = 20
  REMARK_POSITION = '+70+190'
  REMARK_SHADOW_POSITION = '+68+193'
  INDENTION_COUNT = 34
  ROW_LIMIT = 2

  def self.build(text, sub_text, remark)
    text = prepare_text(text)
    sub_text = prepare_text(sub_text)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.gravity GRAVITY
      config.fill 'black'
      if text.length < 28
        config.pointsize NORMAL_FONT_SIZE
      else
        config.pointsize LONG_TEXT_FONT_SIZE
      end
      config.draw "text #{TEXT_SHADOW_POSITION} '#{text}'"
      config.fill 'white'
      if text.length < 28
        config.pointsize NORMAL_FONT_SIZE
      else
        config.pointsize LONG_TEXT_FONT_SIZE
      end
      config.draw "text #{TEXT_POSITION} '#{text}'"
      config.pointsize SUB_FONT_SIZE
      config.fill 'black'
      config.draw "text #{SUB_TEXT_SHADOW_POSITION} '#{sub_text}'"
      config.fill 'white'
      config.draw "text #{SUB_TEXT_POSITION} '#{sub_text}'"
      config.pointsize REMARK_FONT_SIZE
      config.fill 'black'
      config.draw "text #{REMARK_SHADOW_POSITION} '#{remark}'"
      config.fill 'white'
      config.draw "text #{REMARK_POSITION} '#{remark}'"
    end
  end

  private
  def self.prepare_text(text)
    text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end
end