$(function () {
    $('.checkbox_wrapper').on('click', function () {
        $(this).parents('.card').find('.checkbox_childrent').prop('checked', $(this).prop('checked')); // prop trả về true false
    });

    $('.checkall').on('click', function () {
        $(this).parents().find('.checkbox_childrent').prop('checked', $(this).prop('checked'));
        $(this).parents().find('.checkbox_wrapper').prop('checked', $(this).prop('checked'));

    });

});
