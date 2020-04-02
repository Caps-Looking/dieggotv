$(document).on('turbolinks:load', function () {
    $('.competence').on('click', function (event) {
        var monthBillsActive = 'month-bills-active';
        var monthBills = $('.month-bills');

        var competence = $(event.target);
        var competenceActive= 'competence-active';

        monthBills.hasClass(monthBillsActive) ?
            monthBills.removeClass(monthBillsActive) :
            monthBills.addClass(monthBillsActive);

        competence.hasClass(competenceActive) ?
            competence.removeClass(competenceActive) :
            competence.addClass(competenceActive)
    });

    $('.month-bill').on('click', function (event) {
        var monthBill = $(event.target);
        var monthBillActive= 'month-bill-active';

        monthBill.hasClass(monthBillActive) ?
            monthBill.removeClass(monthBillActive) :
            monthBill.addClass(monthBillActive)
    });
});