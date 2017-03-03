$(document).ready(function () {
  $("span#article-list").on("click", "a.inactive-link", function(event){
    event.preventDefault();
    var url = $(this).attr("href");
    var method = "GET";
    $.ajax({
      url: url,
      method: method
    }).success(function(response){
      $("div#new-article-appear").append(response)
      $(event.target).removeClass("inactive-link").addClass("active-link")

     });
  });

  $("span#article-list").on("click", ".active-link", function(event) {
    event.preventDefault()
    $(this).removeClass("active-link").addClass("inactive-link");
    $("div#new-article-appear").empty()
  });


});
