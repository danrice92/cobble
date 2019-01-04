$(function dropdown() {
  $('.ui.dropdown').dropdown()
});

$(function flashMessage() {
  const message = $("#flash-message");
  if(message) setTimeout(function() { message.hide(); }, 3000);
});

$(function tab() {
  $('.tabular.menu .item').tab()
});
