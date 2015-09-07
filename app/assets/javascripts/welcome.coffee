# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("form[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    $(".list-group").load(location.href + " .list-group2");
    # $("#loader2").fadeIn("slow")
