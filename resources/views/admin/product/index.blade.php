 @extends('layouts.admin') <!-- kế thừa -->

@section('title')
    <title>Add Product</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{ asset('/admins/product/index/list.css') }}">
@endsection
@section('js')
    <script src="{{ asset('/vendors/sweetAlert2/sweetalert2@11.js') }}"></script>
    <script type="text/javascript" src="{{ asset('admins/main.js') }}"></script>
@endsection
@section('header')
@include('partials.header-product')
@endsection




@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('partials.content-header', ['name' => 'product' ,'key' => 'List'])
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
        
            <div class="col-md-12">
                <a href="{{ route('product.create') }}" class="btn btn-success float-right m-2">Add</a>
            </div>
            <div class="col-md-12">
                <!-- bootstrap 4 table-->
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Số lượng sản phẩm</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Hình ảnh</th>
                            <th scope="col">Danh mục</th>
                            <th scope="col">Action</th> <!--vs mỗi hàng phải sửa và xóa -->
                        
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($products as $productItem)

                        <tr>
                            <th scope="row">{{ $productItem->id  }}</th>
                            <td>{{ $productItem->name }}</td>
                            <td>{{ $productItem->product_quantity }}</td>
                            <td>{{ number_format($productItem->price) }}</td>
                            <td>
                            <img class="product_image_150_100" src="{{ asset('/') . $productItem->feature_image_path }}" alt="">
                            </td>
                            <td>{{ optional($productItem->category)->name }}</td> <!--optional nếu category k có tự trả về null, k bị bug nữa -->
                            <td>
                                <a href="{{ route('product.edit', ['id' => $productItem->id]) }}" class="btn btn-default">Edit</a>
                                <a href="" 
                                    data-url="{{ route('product.delete', ['id' => $productItem->id]) }}"
                                    class="btn btn-danger action_delete">Delete</a>
                            </td>
                        </tr>
                        
                    @endforeach
                    </tbody>
                </table>
            </div>
            <div class="col-sm-1">
                {{ $products->appends($_GET)->links('pagination::bootstrap-4') }}
            </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
 
