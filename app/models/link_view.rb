class LinkView < ApplicationRecord
  belongs_to :link

  validates :date, presence: true
  validates :record_type, presence: true

  enum :record_type, { one_million: 1, two_million: 2, three_million: 3, four_million: 4, five_million: 5, six_million: 6, seven_million: 7, eight_million: 8, nine_million: 9, ten_million: 10,
                        twenty_million: 20, thirty_million: 30, forty_million: 40, fifty_million: 50, sixty_million: 60, seventy_million: 70, eighty_million: 80, ninety_million: 90, hundred_million: 100,
                        two_hundred_million: 200, three_hundred_million: 300, four_hundred_million: 400, five_hundred_million: 500, six_hundred_million: 600, seven_hundred_million: 700, eight_hundred_million: 800, nine_hundred_million: 900,
                        one_billion: 1000 }
end
