ready = ->
  check_question_type = ->
    question_type = $("#question_question_type").find(":selected").text()
    if question_type == "text"
      $("#choice").hide()
      $("#text").show()
    else
      $("#choice").show()
      $("#text").hide()
      if question_type == "multiple"
        $("#choice").removeClass "radio_fields"
      if question_type == "single"
        $("input:checkbox").removeAttr "checked"
        $("#choice").addClass "radio_fields"

  check_question_type()
  $("#question_question_type").on "change", ->
    check_question_type()

$(document).ready ready
$(document).on "page:load", ready
