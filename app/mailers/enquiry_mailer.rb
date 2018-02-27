class EnquiryMailer < ApplicationMailer
  def response(enquiry_id)
    @enquiry = Enquiry.find(enquiry_id)
    mail to: @enquiry.email, subject: "Thanks for your enquiry."
  end

  def received(enquiry_id)
    @enquiry = Enquiry.find(enquiry_id)
    mail to: "pete@digitalintelligence.institute", subject: "An enquiry has been received!"
  end
end
