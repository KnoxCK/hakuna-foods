$(document).ready(function(){
  $('#verify').click(function(){
    $.ajax({
      type: 'POST',
      url: "/verify_promo_code",
      data: { customer_plan_id: $('#cp_id').val(), code: $('#code').val() }
    })
  })
})
