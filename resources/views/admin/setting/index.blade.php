 
@extends('layouts.admin') <!-- kế thừa -->

@section('title')
    <title>Settings</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{ asset('/admins/setting/index/index.css') }}">    
@endsection

@section('js')
    <script src="{{ asset('/vendors/sweetAlert2/sweetalert2@11.js') }}"></script>
    <script type="text/javascript" src="{{ asset('admins/main.js') }}"></script>
@endsection


@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('partials.content-header', ['name' => 'Setting' ,'key' => 'List'])
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <!-- bootstrap dropdown submenu,Overview and examples -->
                <div class="btn-group float-right">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                        Add setting
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="{{ route('settings.create') . '?type=Text' }}">Text</a></li>
                        <li><a href="{{ route('settings.create') . '?type=Textarea' }}">Textarea</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-12">
                <!-- bootstrap 4 table-->
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Config key</th>
                            <th scope="col">Config value</th>
                            <th scope="col">Action</th> <!--vs mỗi hàng phải sửa và xóa -->
                        
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($settings as $setting)
                      <tr>
                        <th scope="row">{{ $setting->id }}</th>
                          <td>{{ $setting->config_key }}</td>
                          <td>{{ $setting->config_value }}</td>
                          <td>
                            <a href="{{ route('settings.edit', ['id' => $setting->id]) . '?type=' . $setting->type}}" 
                              class="btn btn-default">Edit</a>
                            <a href=""
                              data-url="{{ route('settings.delete', ['id' => $setting->id]) }}"
                              class="btn btn-danger action_delete">Delete</a>
                          </td>
                      </tr>
                    @endforeach
                  </tbody>
                </table>
            </div>
            <div class="col-md-12">
              {{ $settings->links('pagination::bootstrap-4') }}
            </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
 

