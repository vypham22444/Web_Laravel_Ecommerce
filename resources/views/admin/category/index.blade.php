 
@extends('layouts.admin') <!-- kế thừa -->

@section('title')
    <title>Trang chủ</title>
@endsection

@section('js')
    <script src="{{ asset('/vendors/sweetAlert2/sweetalert2@11.js') }}"></script>
    <script type="text/javascript" src="{{ asset('admins/main.js') }}"></script>
@endsection

@section('header')
@include('partials.header-category')
@endsection


@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('partials.content-header', ['name' => 'category' ,'key' => 'List'])
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
        
            <div class="col-md-12">
                <a href="{{ route('categories.create') }}" class="btn btn-success float-right m-2">Add</a>
            </div>
            <div class="col-md-12">
                <!-- bootstrap 4 table-->
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Tên danh mục</th>
                            <th scope="col">Action</th> <!--vs mỗi hàng phải sửa và xóa -->
                        
                        </tr>
                    </thead>
                    <tbody>

                    @foreach($categories as $category)

                        <tr>
                            <th scope="row">{{ $category->id }}</th>
                            <td>{{ $category->name }}</td>
                            <td>
                                <a href="{{ route('categories.edit', ['id' => $category->id]) }}" class="btn btn-default">Edit</a>
                                <!-- <a href="{{ route('categories.delete', ['id' => $category->id]) }}" class="btn btn-danger">Delete</a> -->
                                <a href=""
                                    data-url="{{ route('categories.delete', ['id' => $category->id]) }}"
                                    class="btn btn-danger action_delete">Delete</a>

                            </td>
                        </tr>
                        
                    @endforeach
                    </tbody>
                </table>
            </div>
            <div class="col-sm-1">
                {{ $categories->links('pagination::bootstrap-4') }} <!-- vào laravel,databate,pagination -->
            </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
 
