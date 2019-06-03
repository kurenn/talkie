$("body").on("click", ".talkie-comment-reply-link", function(e){
  e.preventDefault();

  $(this).parent().parent().find("> .talkie-comments-reply-form-container").toggle();
});
