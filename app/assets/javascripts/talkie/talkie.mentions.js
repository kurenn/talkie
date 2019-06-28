$( document ).on('ready turbolinks:load', function() {
  $('textarea.talkie-comment-body-textarea').mentionsInput({
    showAvatars: false,
    allowRepeat: true,
    minChars: 2,
    onDataRequest: function (mode, query, callback) {
      $.getJSON('/talkie/mentions',
        { q: query },
        function(responseData) {
          callback.call(this, responseData);
        });
    }
  });

  $("form.talkie-comments-form").on("submit", function(event) {
    event.stopPropagation();

    $commentsForm = $(this);

    $commentsForm.find('textarea.talkie-comment-body-textarea').mentionsInput('getMentions', function(data) {
      $commentsForm.find(".comment-mentions").val(JSON.stringify(data));
    });

  })
})
