$(document).on('turbolinks:load', function() {
   $("[data-mask=cpf]").mask("999.999.999-99");

   $("form").on("submit", function() {
       $("[data-mask=cpf]").unmask();
   })
});