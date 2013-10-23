class Ad < ActiveRecord::Base
  set_primary_key :adId

  # Callbacks
  before_create :set_key

  # Validations
  validates_presence_of :titleOfAd, :businessAd, :imageAddressAd, :urlAd,
    :businessContact, :businessPhone, :businessEmail, :businessAddress,
    :active, :size
  validates_format_of :urlAd, :with => URI::regexp(%w(http https)),
    :message => "Invalid URL link in URL Ad"
  validates_numericality_of :businessPhone,
    :message => "Invalid format of Phone Number"
  validates_format_of :businessEmail,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => "Invalid Email Format"

  # Validates the length of the inputs
  def validate
    errors.add_to_base("Your phone number is to long!") if self.businessPhone.to_s.length > 15
    errors.add_to_base("Your Title is to long")if self.titleOfAd.to_s.length > 50
    errors.add_to_base("Your Buiness is to long")if self.businessAd.to_s.length > 50
    errors.add_to_base("Your URL is to long")if self.urlAd.to_s.length > 50
    errors.add_to_base("Your Contact is to long")if self.businessContact.to_s.length > 50
    errors.add_to_base("Your Email is to long")if self.businessEmail.to_s.length > 50
    errors.add_to_base("Your Business is to long")if self.businessAddress.to_s.length > 50
    errors.add_to_base("Your Size is to long")if self.size.to_s.length > 2
    errors.add_to_base("Your phone number is to short!") if self.businessPhone.to_s.length < 7
  end

  private
  
  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = Ad.find_by_sql('select max(adId) as maxid from ad')[0].maxid
    self.adId = last_key.to_i + 1
  end
end
