class OgpCreator
  require 'mini_magick'
  BASE_IMAGE_PATH = './app/assets/images/dynamic_ogp_background.jpeg'.freeze
  FONT = './app/assets/fonts/DotGothic16,M_PLUS_1p/DotGothic16/DotGothic16-Regular.ttf'.freeze
  GRAVITY = 'NorthWest'.freeze
  ONE_LINE_MAX_LENGTH = 26
  TWO_LINE_FONT_SIZE = 25
  ONE_LINE_FONT_SIZE = 35
  ONE_LINE_POSITION = '+56+110'.freeze
  ONE_LINE_SHADOW_POSITION = '+54+108'.freeze
  TWO_LINE_POSITION = '+56+100'.freeze
  TWO_LINE_SHADOW_POSITION = '+54+101'.freeze
  SUB_FONT_SIZE = 17
  SUB_TEXT_POSITION = '+56+68'.freeze
  SUB_TEXT_SHADOW_POSITION = '+54+69'.freeze
  REMARK_FONT_SIZE = 20
  REMARK_POSITION = '+56+190'.freeze
  REMARK_SHADOW_POSITION = '+54+193'.freeze
  INDENTION_COUNT = 34
  SUB_TEXT_INDENTION_COUNT = 34
  ROW_LIMIT = 2

  def self.build(text, sub_text, remark)
    text = prepare_text(text)
    sub_text = prepare_text(sub_text)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.gravity GRAVITY
      config.fill 'black'
      determine_text_style(text, config)
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

  def self.prepare_text(text)
    text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end

  def self.determine_text_style(text, config)
    if text.bytesize < ONE_LINE_MAX_LENGTH
      config.pointsize ONE_LINE_FONT_SIZE
      config.draw "text #{ONE_LINE_SHADOW_POSITION} '#{text}'"
      config.fill 'white'
      config.pointsize ONE_LINE_FONT_SIZE
      config.draw "text #{ONE_LINE_POSITION} '#{text}'"
    else
      config.pointsize TWO_LINE_FONT_SIZE
      config.draw "text #{TWO_LINE_SHADOW_POSITION} '#{text}'"
      config.fill 'white'
      config.pointsize TWO_LINE_FONT_SIZE
      config.draw "text #{TWO_LINE_POSITION} '#{text}'"
    end
  end
end
