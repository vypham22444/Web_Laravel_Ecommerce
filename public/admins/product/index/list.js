function actionDelete(event){
    event.preventDefault();// ngăn cản trình duyệt chuyển tiếp người dùng tới trang
    let urlRequest = $(this).data('url');
    //alert(urlRequest);
    let that = $(this);

    //36,39
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.value) {
            $.ajax({
               type: 'GET',
               url: urlRequest,
               success: function (data) {
                   if (data.code == 200) {
                       that.parent().parent().remove();
                       Swal.fire(
                           'Deleted!',
                           'Your file has been deleted.',
                           'success'
                       )
                   }

               },
               error: function () {

               }
            });
        }
    })

}

//nhan vao delete moi chay, action_delete ten class ben index
$(function () {
   $(document).on('click', '.action_delete', actionDelete);
});

// k dùng đến, dùng bên add to cart
function addToCart(event) {
    event.preventDefault();
    let.urlCart = $(this).data('url');
    $.ajax({
        type: 'GET',
        url: urlCart,
        dataType: 'json',
        success: function (data) {
            if (data.code === 200) {
                alert('okokokokok')
            }
        },
        error: function () {

        }
    });
}

$(function () {
   $(document).on('click', '.add-to-cart', addToCart);
});