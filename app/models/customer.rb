class Customer < ApplicationRecord

  has_one :address, dependent: :destroy
  has_one :customer_plan
  has_many :orders, through: :customer_plan

  validates_presence_of :postcode
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :gender
  validates_presence_of :height
  validates_presence_of :weight
  validates_presence_of :phone

  def check_postcode(postcode)
    valid_postcodes = ['N1', 'N2', 'N3', 'N4', 'N5', 'N6', 'N7', 'N8', 'N9',
      'N10', 'N11', 'N12', 'N13', 'N14', 'N15', 'N16', 'N17', 'N18', 'N19',
      'N20', 'N21', 'N22', 'NW1', 'NW2', 'NW3', 'NW4', 'NW5', 'NW6', 'NW7',
      'NW8', 'NW9', 'NW10', 'NW11', 'WC1A', 'WC1B', 'WC1E', 'WC1H', 'WC1N',
      'WC1R', 'WC1V', 'WC1X', 'WC2A', 'WC2B', 'WC2E', 'WC2H', 'WC2N', 'WC2R',
       'EC1A', 'EC1M', 'EC1N', 'EC1P', 'EC1R', 'EC1V', 'EC1Y', 'EC2A', 'EC2M',
       'EC2N', 'EC2P', 'EC2R', 'EC2V', 'EC2Y', 'EC3A', 'EC3M', 'EC3N', 'EC3P',
       'EC3R', 'EC3V', 'EC4A', 'EC4M', 'EC4N', 'EC4P', 'EC4R', 'EC4V', 'EC4Y',
        'SW1', 'SW3', 'SW5', 'SW6', 'SW7', 'SW10', 'W1', 'W2', 'W3', 'W4', 'W5',
         'W6', 'W7', 'W8', 'W9', 'W10', 'W11', 'W12', 'W13', 'W14', 'E1',
          'E2', 'E3', 'E4', 'E5', 'E6', 'E7', 'E8', 'E9', 'E10', 'E11', 'E12',
          'E13', 'E14', 'E15', 'E16', 'E17', 'E18', 'E20', 'AL1', 'AL2', 'AL3',
          'AL4', 'AL5', 'AL6', 'AL7', 'AL8', 'AL9', 'AL10', 'CM20', 'CM21',
          'CM23', 'EN5', 'EN6', 'EN7', 'EN8', 'EN10', 'EN11', 'HA6', 'HP1',
          'HP2', 'HP3', 'HP4', 'HP5', 'HP23', 'LU2', 'SG1', 'SG2', 'SG3', 'SG4',
           'SG5', 'SG6', 'SG7', 'SG8', 'SG9', 'SG10', 'SG11', 'SG12', 'SG13',
           'SG14', 'WD1', 'WD2', 'WD3', 'WD4', 'WD5', 'WD6', 'WD7' ]
    valid_postcodes.include?(postcode.upcase)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def formatted_dob
    self.dob.strftime("%d %B %Y")
  end

end
