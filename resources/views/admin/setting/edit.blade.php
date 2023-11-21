 
@extends('layouts.admin') <!-- kế thừa -->

@section('title')
    <title>Settings</title>
@endsection


@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('partials.content-header', ['name' => 'settings' ,'key' => 'Edit'])
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
            <div class="col-md-6"> <!-- rộng ra -->
                
                <!-- bootstrap 4 form-->
                <form action = "{{ route('settings.update', ['id' => $setting->id]) }}" method="post">
                    @csrf
                    <div class="form-group">
                        <label>Config key</label>
                        <input type="text" 
                          class="form-control @error('config_key') is-invalid @enderror" 
                          name="config_key"
                          placeholder="Nhập Config key"
                          value="{{ $setting->config_key }}"
                        >
                        @error('config_key')
                          <div class="alert alert-danger">{{ $message }}</div>
                        @enderror

                    </div>

                    @if(request()->type === 'Text')
                        <div class="form-group">
                            <label>Config value</label>
                                <input type="text"
                                    class="form-control @error('config_value') is-invalid @enderror"
                                    name="config_value"
                                    placeholder="Nhập config value"
                                    value="{{ $setting->config_value }}"
                                >
                                @error('config_value')
                                  <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                        </div>
                        @elseif(request()->type === 'Textarea')
                        <div class="form-group">
                            <label>Config value</label>
                            <textarea
                                class="form-control @error('config_value') is-invalid @enderror"
                                name="config_value"
                                placeholder="Nhập config value"
                                rows="5"
                            >{{ $setting->config_value }}</textarea>
                            @error('config_value')
                              <div class="alert alert-danger">{{ $message }}</div>
                            @enderror

                        </div>

                    @endif


                  <button type="submit" class="btn btn-primary">Submit</button>
              </form>
          </div>
        
            
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
 
