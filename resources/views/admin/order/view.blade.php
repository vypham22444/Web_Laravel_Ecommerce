 
@extends('layouts.admin') <!-- kế thừa -->

@section('title')
    <title>Trang chủ</title>
@endsection

@section('js')
    <script src="{{ asset('/vendors/sweetAlert2/sweetalert2@11.js') }}"></script>
    <!-- <script type="text/javascript" src="{{ asset('admins/main.js') }}"></script> -->
    <script type="text/javascript">
        $('.order_details').change(function(){
            //let urlRequest = $(this).data('url');
            var order_status = $(this).val();
            var order_id = $(this).children(":selected").attr("id");
            var _token = $('input[name="_token"]').val();
            //alert(order_id);
            //var _token = $('input[name="_token"]').val();//kiểm tra chống bảo mật

            //lay ra so luong
            quantity = [];
            $("input[name='product_sales_quantity']").each(function(){
                quantity.push($(this).val());
            });
            //lay ra product id
            order_product_id = [];
            $("input[name='order_product_id']").each(function(){
                order_product_id.push($(this).val());
            });
            //alert('Thay đổi tình trạng đơn hàng thành công');
            $.ajax({
                    url : '{{url('/admin/order/updateOrderQty')}}',
                        method: 'POST',
                        data:{_token:_token, order_status:order_status ,order_id:order_id ,quantity:quantity, order_product_id:order_product_id},
                        success:function(data){
                            alert('Thay đổi tình trạng đơn hàng thành công');
                            location.reload();
                        }
            });
            // alert(quantity);
            // alert(order_product_id);

            // j = 0;
            // for(i=0;i<order_product_id.length;i++){
            //     //so luong khach dat
            //     var order_qty = $('.order_qty_' + order_product_id[i]).val();
            //     //so luong ton kho
            //     var order_qty_storage = $('.order_qty_storage_' + order_product_id[i]).val();

            //     if(parseInt(order_qty)>parseInt(order_qty_storage)){
            //         j = j + 1;
            //         if(j==1){
            //             alert('Số lượng bán trong kho không đủ');
            //         }
            //         $('.color_qty_'+order_product_id[i]).css('background','#000');
            //     }
            // }
            // if(j==0){
            
            //         $.ajax({
            //                 url : '{{url('/update-qty')}}',
            //                     method: 'POST',
            //                     data:{order_status:order_status ,order_id:order_id ,quantity:quantity, order_product_id:order_product_id},
            //                     success:function(data){
            //                         alert('Thay đổi tình trạng đơn hàng thành công');
            //                         location.reload();
            //                     }
            //         });
                
            // }

        });
    </script>
@endsection

@section('header')
@include('partials.header-category')
@endsection


@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('partials.content-header', ['name' => 'Đơn Hàng' ,'key' => 'Chi tiết'])
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
        
            
            <div class="col-md-12">
                <div class="card">
                    <!-- bootstrap 4 table-->
                    <div class="">
                        <div class="card-header">
                            <h5 style ="text-align:center"><b>Thông Tin người mua</b></h3>
                        </div>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Tên Người mua</th>
                                <th scope="col">Email</th>
                                <th scope="col">Số điện thoại</th>
                            
                            </tr>
                        </thead>
                        <tbody>


                            <tr>
                                <th scope="row">{{$customer->name}}</th>
                                <td>{{$customer->email}}</td>
                                <td>{{$customer->phone}}</td>
                            </tr>
                            
                        
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            <div class="col-md-12">
                <div class="card">
                    <div class="">
                        <div class="card-header">
                            <h5 style ="text-align:center"><b>Thông Tin Vận Chuyển</b></h3>
                        </div>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Tên Người vận chuyển</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Ghi chú</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{{ $shipping->name}}</td>
                                <td>{{ $shipping->address }}</td>
                                <td>{{ $shipping->phone }}</td>
                                <td>{{ $shipping->notes }}</td>
                            
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="col-md-12">
                <div class="card">
                    <div class="">
                        <div class="card-header">
                            <h5 style ="text-align:center"><b>Thông Tin Đơn Hàng</b></h3>
                        </div>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID Sản phẩm</th>
                                <th scope="col">Tên Sản phẩm</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Kho</th>
                                <th scope="col">Giá</th> 
                                <th scope="col">Tổng tiền</th> 
                            
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $i=0;
                                $total=0;
                            @endphp

                            @foreach($order_detail as $key => $order_details)
                                @php
                                    $i++;
                                    $subtotal=$order_details->product_price*$order_details->product_sales_quatity;
                                    $total+=$subtotal;
                                @endphp
                                <tr>
                                    <td>
                                        <input type="hidden" name="order_product_id" class="order_product_id" value="{{ $order_details->product_id }}">
                                        {{ $order_details->product_id }}
                                    </td>
                                    <td>{{ $order_details->product_name }}</td>
                                    <td>
                                        <input type="hidden" name="product_sales_quantity" class="product_sales_quantity" value="{{ $order_details->product_sales_quatity }}">
                                        {{ $order_details->product_sales_quatity }}</td>
                                    <td>{{ $order_details->product->product_quantity }}</td>
                                    <td>{{ number_format($order_details->product_price,0,',','.') }} đ</td>
                                    <td>{{ number_format($subtotal,0,',','.') }} VNĐ</td>
                                
                                </tr>
                            @endforeach
                            <td>Thanh toán: {{ number_format($total,0,',','.') }} VNĐ</td>
                            <tr>
                                <td colspan="6">
                                @foreach($order as $key => $or)
                                    @if($or->status==1)
                                    <form>
                                    @csrf
                                    <select class="form-control order_details">
                                        <option value="">----Chọn hình thức đơn hàng-----</option>
                                        <option id="{{$or->id}}" selected value="1">Chưa xử lý</option>
                                        <option id="{{$or->id}}" value="2">Đã xử lý-Đã giao hàng</option>
                                        <option id="{{$or->id}}" value="3">Hủy đơn hàng-tạm giữ</option>
                                    </select>
                                    </form>
                                    @elseif($or->status==2)
                                    <form>
                                    @csrf
                                    <select class="form-control order_details">
                                        <option value="">----Chọn hình thức đơn hàng-----</option>
                                        <option id="{{$or->id}}" value="1">Chưa xử lý</option>
                                        <option id="{{$or->id}}" selected value="2">Đã xử lý-Đã giao hàng</option>
                                        <option id="{{$or->id}}" value="3">Hủy đơn hàng-tạm giữ</option>
                                    </select>
                                    </form>

                                    @else
                                    <form>
                                    @csrf
                                    <select class="form-control order_details">
                                        <option value="">----Chọn hình thức đơn hàng-----</option>
                                        <option id="{{$or->id}}" value="1">Chưa xử lý</option>
                                        <option id="{{$or->id}}"  value="2">Đã xử lý-Đã giao hàng</option>
                                        <option id="{{$or->id}}" selected value="3">Hủy đơn hàng-tạm giữ</option>
                                    </select>
                                    </form>

                                    @endif
                                @endforeach


                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="">In đơn hàng</a>
                </div>
            </div>
            
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
 
