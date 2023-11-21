 
@extends('layouts.admin') <!-- kế thừa -->

@section('title')
    <title>Trang chủ</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{ asset('/admins/slider/index/index.css') }}">
@endsection

@section('js')
    <script src="{{ asset('/vendors/sweetAlert2/sweetalert2@11.js') }}"></script>
    <script type="text/javascript" src="{{ asset('admins/main.js') }}"></script>
@endsection

@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('partials.content-header', ['name' => 'User' ,'key' => 'List'])
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
        
            <div class="col-md-12">
                <a href="{{ route('users.create') }}" class="btn btn-success float-right m-2">Add</a>
            </div>
            <div class="col-md-12">
                <!-- bootstrap 4 table-->
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Tên</th>
                            <th scope="col">Email</th>
                            <th scope="col">Action</th> <!--vs mỗi hàng phải sửa và xóa -->
                        
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($users as $user)
                      <tr>
                        <th scope="row">{{ $user->id }}</th>
                          <td>{{ $user->name }}</td>
                          <td>{{ $user->email }}</td>
                          <td>
                            <a href="{{ route('users.edit', ['id' => $user->id]) }}" class="btn btn-default">Edit</a>

                            <a href=""
                              data-url="{{ route('users.delete', ['id' => $user->id]) }}"
                              class="btn btn-danger action_delete">Delete</a>

                          </td>
                      </tr>
                    @endforeach

                  </tbody>
                </table>
            </div>
            <div class="col-md-12">
                {{ $users->links('pagination::bootstrap-4') }}
            </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
 
