class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: @review.user.email,
      subject: "#{@review.user.username}! Someone reviewed your unboxing!!!!"
    )
  end
end
