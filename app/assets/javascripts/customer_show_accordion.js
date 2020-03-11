$(document).on('turbolinks:load', function () {
    $('.competence').on('click', function (event) {
        const monthBillsActive = 'month-bills-active';
        const monthBills = $('.month-bills');

        const competence = $(event.target);
        const competenceActive= 'competence-active';

        monthBills.hasClass(monthBillsActive) ?
            monthBills.removeClass(monthBillsActive) :
            monthBills.addClass(monthBillsActive);

        competence.hasClass(competenceActive) ?
            competence.removeClass(competenceActive) :
            competence.addClass(competenceActive)
    });

    $('.month-bill').on('click', function (event) {
        const monthBill = $(event.target);
        const monthBillActive= 'month-bill-active';

        monthBill.hasClass(monthBillActive) ?
            monthBill.removeClass(monthBillActive) :
            monthBill.addClass(monthBillActive)
    });
});