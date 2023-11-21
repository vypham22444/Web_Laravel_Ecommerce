 
@extends('layouts.admin') <!-- kế thừa -->

@section('title')
    <title>Trang chủ</title>
@endsection


@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('partials.content-header', ['name' => 'Home' ,'key' => 'home'])
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
      <style type"text/css">
          p.thongke {
              text-align: center;
              font-size: 20px;
              font-weight: bold;
          }
      </style>

      <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>{{ $product_count }}</h3>

                <p>Tổng sản phẩm</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="{{ route('product.index') }}" class="small-box-footer">Chi tiết <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>{{ $order_count }}</h3>

                <p>Tổng đơn hàng</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="{{ route('order.index') }}" class="small-box-footer">Chi tiết <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>{{ $category_count }}</h3>

                <p>Tổng danh mục</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="{{ route('categories.index') }}" class="small-box-footer">Chi tiết <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          
          <!-- ./col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->

      <div class="container">
      <div class="row">
        <div class="col-md-12">
          <p class="thongke"> Thống kê đơn hàng</p>
        </div>

        <from autocomplete="off">
          @csrf

          <div class="col-md-12">
              <p> Từ ngày :<input type="text" id="datepicker" class="from-control"></p>
              <p> Đến ngày :<input type="text" id="datepicker2" class="from-control"></p>
            
          </div>
          <div class="col-md-12">
            <input type="bunton" id="loc" class="btn btn-primary btn-sm" value="Lọc kết quả">
          </div>

          <div class="col-md-12">
            <p>
              Lọc Theo:
              <select class="chon-hinh-thuc-loc">
                <option>---- Chọn-----</option>
                <option value="7ngay">7 ngày qua</option>
                <option value="thangtruoc">Tháng trước</option>
                <option value="thangnay">Tháng này</option>
                <option value="365ngayqua">365 ngày qua</option>
              </select>
            </p>
          </div>


        </from>
        <div class="col-md-12">
          <div id="myfirstchart" style="height: 250px;"></div>
        </div>

      </div>
      </div>

    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
 
@section('js')
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
  } );
  $( function() {
    $( "#datepicker2" ).datepicker({ dateFormat: 'yy-mm-dd' });
  } );
  </script>
  
  <script type="text/javascript">
    $(document).ready(function(){

      chart30daysorrder();

      var chart = new Morris.Bar({
      // ID of the element in which to draw the chart.
        element: 'myfirstchart',
        
        xkey: 'ngay',
        ykeys: ['tong','doanhso','quantity'],
        behaveLikeLine: true,
        labels: ['đơn hàng', 'doanh số', 'số lượng']
      });

      function chart30daysorrder(){
        var _token = $('input[name="_token"]').val();
        $.ajax({
          url : '{{url('/thang-nay')}}',
              method: 'POST',
              dataType:"JSON",
              data:{_token:_token},
              success:function(data){
                chart.setData(data);
              }
        });

      }

      $('.chon-hinh-thuc-loc').change(function(){
        var hinh_thuc = $(this).val();
        var _token = $('input[name="_token"]').val();
        //alert(hinh_thuc);
        $.ajax({
          url : '{{url('/chon-hinh-thuc-loc')}}',
              method: 'POST',
              dataType:"JSON",
              data:{_token:_token, hinh_thuc:hinh_thuc},
              success:function(data){
                chart.setData(data);
              }
        });
      });


      $('#loc').click(function(){
        var tu_ngay = $('#datepicker').val();
        var den_ngay = $('#datepicker2').val();
        var _token = $('input[name="_token"]').val();//kiểm tra chống bảo mật
        // alert(tu_ngay);
        // alert(den_ngay);
        $.ajax({
          url : '{{url('/loc-theo-ngay')}}',
              method: 'POST',
              dataType:"JSON",
              data:{_token:_token, tu_ngay:tu_ngay ,den_ngay:den_ngay},
              success:function(data){
                chart.setData(data);
              }
        });
      });

    });
  </script>


@endsection