function addToCart(event) {
    event.preventDefault();
    let urlCart = $(this).data('url');
    $.ajax({
        type: 'GET',
        url: urlCart,
        dataType: 'json',
        success: function (data) {
            if (data.code === 200) {
                alert('Thêm sản phẩm thành công')
            }
        },
        error: function () {

        }
    });
}

function cartUpdate(event) {
    event.preventDefault();
    let urlUpdateCart = $('.update_cart_url').data('url');
    let id = $(this).data('id'); 
    let quatity = $(this).parents('tr').find('input.cart_quantity_input').val();
    
    $.ajax({
        type: 'GET',
        url: urlUpdateCart,
        data: {id: id, quatity: quatity},
        success: function (data) {
            if (data.code === 200) {
                $('.cart_wrapper').html(data.cart_components);
                alert('update thành công')
            }
        },
        error: function () {

        }
    });
            
}

function cartDelete(event) {
    event.preventDefault();
    let urlUpdateCart = $('.delete_cart_url').data('url');
    let id = $(this).data('id'); 
    $.ajax({
        type: 'GET',
        url: urlUpdateCart,
        data: {id: id},
        success: function (data) {
            if (data.code === 200) {
                $('.cart_wrapper').html(data.cart_components);
                alert('Delete thành công')
            }
        },
        error: function () {

        }
    });
            
}

$(function () {
    $(document).on('click', '.add-to-cart', addToCart);
    $(document).on('click', '.cart_update', cartUpdate);
    $(document).on('click', '.delete_cart', cartDelete);
 });
