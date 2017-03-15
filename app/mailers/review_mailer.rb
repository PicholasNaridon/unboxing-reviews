class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    binding.pry

    mail(
      to: review.product.user.email,
      subject: "New Review for #{review.product.name}"
    )
  end
end
