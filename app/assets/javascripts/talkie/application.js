//= require underscore
//= require jquery.elastic
//= require jquery.mentionsinput

$("body").on("click", ".talkie-comment-reply-link", function(e){
  e.preventDefault();

  $(this).parent().parent().find("> .talkie-comments-reply-form-container").toggle();
});

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

