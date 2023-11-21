 
@extends('layouts.admin') <!-- kế thừa -->

@section('title')
    <title>Trang chủ</title>
@endsection

@section('js')
    <script src="{{ asset('/vendors/sweetAlert2/sweetalert2@11.js') }}"></script>
    <!-- <script type="text/javascript" src="{{ asset('admins/main.js') }}"></script> -->
    <script type="text/javascript">
       
    $('.send_order').on('click', function () {
        var orderCode=$(this).data('url');
        alert(orderCode);
        // Swal.fire({
        //     position: 'top-end',
        //     icon: 'success',
        //     title: 'Đơn hàng đã được xử lý',
        //     showConfirmButton: false,
        //     timer: 30000
            

        //     });
        });
    </script>
@endsection

@section('header')

@endsection


@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('partials.content-header', ['name' => 'Order' ,'key' => 'List'])
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
        
            
            <div class="col-md-12">
                <!-- bootstrap 4 table-->
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Thứ tự</th>
                            <th scope="col">Mã đơn hàng</th>
                            <th scope="col">Ngày tháng đặt hàng</th>
                            <th scope="col">Tình trạng đơn hàng</th>
                            <th scope="col">Hiện thị</th> <!--vs mỗi hàng phải sửa và xóa -->
                        
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $i=0;
                        @endphp

                    @foreach($all_order as $order)
                        @php
                            $i++;
                        @endphp

                        <tr>
                            <td>{{$i}}</td>
                            <th scope="row">{{ $order->order_code }}</th>
                            <td>{{$order->created_at}}</td>
                            <td>@if($order->status ==1)
                                    Đơn hàng mới
                                @else
                                    Đã xử lý
                                @endif
                            </td>
                            <td>
                                <a href="{{ route('order.view', ['orderCode' => $order->order_code]) }}" class="btn btn-default">Chi tiết</a>
                                
                                <!--  -->

                            </td>
                        </tr>
                        
                    @endforeach
                    </tbody>
                </table>
            </div>
            <div class="col-md-12">
              {{ $all_order->links('pagination::bootstrap-4') }}
            </div>
            
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
 
