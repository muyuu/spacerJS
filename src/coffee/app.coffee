(()->
  $('.fixedNav').spacer()
  $("#toggleclass").bind "click", ->
    $('.fixedNav').spacer( off: true )

)()
