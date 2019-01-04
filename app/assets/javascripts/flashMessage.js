$(function() {
  const message = $("#flash-message");
  if(message) {
    setTimeout(function() { message.hide(); }, 3000);
  }
});
