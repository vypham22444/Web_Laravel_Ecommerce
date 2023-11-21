<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="{{ route('nd') }}">Home</a></li>
                <li class="active">Giỏ hàng của bạn</li>
            </ol>
        </div>
       
        <?php
        $content = Cart::content();
        ?>
        <div class="table-responsive cart_info delete_cart_url" > 
            
            <table class="table table-condensed update_cart_url">
                <thead>
                    <tr class="cart_menu">
                        <td class="image">Hình ảnh</td>
                        <td class="description"></td>
                        <td class="price">Giá</td>
                        <td class="quantity">Số lượng</td>
                        <td class="total">Tổng</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    @foreach($content as $contents)
                     
                        <tr>
                            <td class="cart_product">
                                <a href=""><img style="width:100px; height:100px; object-fit: contain"
                                    src="{{ asset('') . $contents->options->image }}" alt="">
                                </a>
                            </td>
                            <td class="cart_description">
                                <h4><a href="">{{ $contents->name }}</a></h4>
                                <p>ID: {{ $contents->id }}</p>
                            </td>
                            <td class="cart_price">
                                <p>{{ number_format($contents->price) }} </p>
                            </td>
                            <td class="cart_quantity">
                                <div class="cart_quantity_button">
                                <form action="{{ route('updateCart') }}" method="POST">
							        {{csrf_field()}}
                                    <!-- <a class="cart_quantity_up" href=""> + </a> -->
                                    <input class="cart_quantity_input" type="number" name="quantity" value="{{ $contents->qty }}" min ="1"   size="2">
                                    <input type="hidden" name="rowId" value="{{ $contents->rowId }}" class="form-control">
                                    <input type="submit" name="update_qty" value="Cập nhật" class="cart_quantity_delete">
                                    <!-- <a class="cart_quantity_down" href=""> - </a> -->
                                </form>
                                </div>
                            </td>
                            <td class="cart_total">
                                <p class="cart_total_price">{{ number_format($contents->price * $contents->qty) }} VNĐ</p>
                            </td>
                            <td class="cart_delete">
                                <!-- <a class="cart_quantity_delete" href="{{ route('updateCart', ['rowId' => $contents->rowId]) }}" >Cập Nhật</a> -->
                                <a class="cart_quantity_delete" href="{{ route('deleteCart', ['rowId' => $contents->rowId]) }}"><i class="fa fa-times"></i></a>
                            </td>
                        </tr>
                    
                    @endforeach

                </tbody>
            </table>
            
        </div>
    </div>
</section> <!--/#cart_items-->

<section id="do_action">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 pull-right">
                <div class="total_area">
                    <ul>
                        <li>Giá vận chuyển <span>Free</span></li>
                        <li>
                            <h2>
                                <p class="cart_total_price">Total <span>{{ Cart::total() }} VNĐ</span>
                                </p>
                            </h2>
                        </li>
                    </ul>

                    <?php
                        $customer_id = Session::get('id');
                        $shipping_id = Session::get('id');
                        // if($customer_id != NULL && $shipping_id == NULL){
                        if($customer_id != NULL){
                    ?>
                        <!-- <a class="btn btn-default check_out" href="{{ route('checkout') }}">Thanh toán</a> -->
                    <!--  -->
                        <a class="btn btn-default check_out" href="{{ route('payment') }}">Thanh toán</a>
                    <?php
                        }elseif($customer_id == NULL){
                    ?>
                        <a class="btn btn-default check_out" href="{{ route('loginCheckout') }}">Thanh toán</a>
                    <?php
                        }
                    ?>      
                </div>

            </div>
        </div>
    </div>
</section><!--/#do_action-->