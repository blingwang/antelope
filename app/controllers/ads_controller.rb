class AdsController < ApplicationController
  
  before_filter :authenticate

  active_scaffold :ad do |config|
    config.columns[:titleOfAd].label = "Title:"
    config.columns[:businessAd].label = "Ad Name:"
    config.columns[:imageAddressAd].label = "Image:"
    config.columns[:urlAd].label = "URL Location:"
    config.columns[:businessContact].label = "Contact Person:"
    config.columns[:businessAddress].label = "Address:"
    config.columns[:businessPhone].label = "Phone Number:"
    config.columns[:businessEmail].label = "Email:"
    config.columns[:size].label = "Size of Ad:"
  end

  def create_authorized?
    student_editor?
  end

  def update_authorized?
    student_editor?
  end

  def delete_authorized?
    webmaster?
  end
end
