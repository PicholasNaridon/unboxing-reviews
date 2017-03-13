$(document).ready(() => {
  $('.upvote').on('click', function(e) {
     e.preventDefault();

     let $this = $(this);
     let reviewId = $this.data('reviewid');

     let request = $.ajax({
        method: "POST",
        url: '/reviews/' + reviewId + '/votes',
        data: { value: 1 }
      });

      request.done((data) => {
        $('.total-votes-' + data.review_id ).html(data.votes_count);
      })
   })

  $('.downvote').on('click', function(e) {
     e.preventDefault();

     let $this = $(this);
     let reviewId = $this.data('reviewid');

     let request = $.ajax({
        method: "POST",
        url: '/reviews/' + reviewId + '/votes',
        data: { value: -1 }
      });

      request.done((data) => {
        $('.total-votes-' + data.review_id ).html(data.votes_count);
      })
  });
})
