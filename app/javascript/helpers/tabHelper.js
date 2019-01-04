import $ from "jquery";

export default function tabHelper() {
  $(function() {
    const signUpTab = $("#sign-up-tab");
    const signUpContent = $("#sign-up-content");

    const signInTab = $("#sign-in-tab");
    const signInContent = $("#sign-in-content");

    signUpTab.on("click", function() {
      if (!signUpTab.hasClass("active")) {
        signInTab.removeClass("active");
        signInContent.removeClass("active");

        signUpTab.addClass("active");
        signUpContent.addClass("active");
      }
    });

    signInTab.on("click", function() {
      if (!signInTab.hasClass("active")) {
        signUpTab.removeClass("active");
        signUpContent.removeClass("active");

        signInTab.addClass("active");
        signInContent.addClass("active");
      }
    });
  })
}
