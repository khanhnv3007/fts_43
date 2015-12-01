var ready
ready = function () {
  $("#new_question, .edit_question").submit(function () {
    var question_type = $("#question_question_type").find(":selected").text()
    if(question_type == "text"){
      $("#choice").remove()
    }
    else{
      if (question_type == "multiple") {
        if ($("input:checkbox:checked").length <= 1) {
          alert(I18n.t("question.please_choose_multiple_correct_answer"))
          return false
        }
      } else if (question_type == "single") {
        if ($("input:checkbox:checked").length === 0) {
          alert(I18n.t("question.please_choose_a_correct_answer"))
          return false
        }
      }
      $("#text").remove()
    }
    return true
  })
  make_radio_from_checkbox()

  $("body").on("DOMNodeInserted", function () {
    make_radio_from_checkbox()
  })

  $("#filter_form").on("change", function () {
    $(this).submit()
  })
}

function make_radio_from_checkbox () {
  $(".radio_fields .radio_answer").click(function () {
    $(".radio_fields .radio_answer").not(this).attr("checked", false)
  })
}

$(document).ready(ready)
$(document).on("page:load", ready)
