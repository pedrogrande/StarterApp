class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @new_freelancers = FreelancerProfile.last(2)
    @new_gigs = Gig.last(2)
  end
end
