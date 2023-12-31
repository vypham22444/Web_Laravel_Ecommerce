@extends('layouts.admin')

@section('title')
    <title>Add product</title>
@endsection
 <!-- tk select2 -->
@section('css')
    <link href="{{ asset('/vendors/select2/select2.min.css') }}" rel="stylesheet"/>
    <link href="{{ asset('/admins/product/add/add.css') }}" rel="stylesheet"/>
@endsection




@section('content')

    <div class="content-wrapper">
        @include('partials.content-header', ['name' => 'product', 'key' => 'Add'])
        <div class="col-md-12"> <!-- chua cac bug, co bug thi in ra loi -->
            <!--tk laravel, validation, Displaying The Validation Errors --> 
            <!-- @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif -->
        </div>
        <form action="{{ route('product.store') }}" method="post" enctype="multipart/form-data">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            
                                @csrf
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <!--tk laravel, validation, The error Directive --> 
                                    <input type="text"
                                        class="form-control 
                                            @error('name') is-invalid @enderror"
                                        name="name"
                                        placeholder="Nhập tên sản phẩm"
                                        value="{{ old('name') }}"
                                    >
                                    @error('name')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label>Số lượng sản phẩm</label>
                                    <input type="text"
                                        class="form-control 
                                            @error('product_quantity') is-invalid @enderror"
                                        name="product_quantity"
                                        placeholder="Nhập số lượng sản phẩm"
                                        value="{{ old('product_quantity') }}"
                                    >
                                    @error('product_quantity')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror

                                </div>
                                <div class="form-group">
                                    <label>Giá sản phẩm</label>
                                    <input type="text"
                                        class="form-control 
                                            @error('price') is-invalid @enderror"
                                        name="price"
                                        placeholder="Nhập giá sản phẩm"
                                        value="{{ old('price') }}"
                                    >
                                    @error('price')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror

                                </div>

                                <div class="form-group">
                                    <label>Ảnh đại diện</label>
                                    <input type="file"
                                        class="form-control-file"
                                        name="feature_image_path"
                                    >
                                </div>

                                <div class="form-group">
                                    <label>Ảnh chi tiết</label>
                                    <input type="file"
                                        multiple 
                                        class="form-control-file mb-2 preview_image_detail"
                                        name="image_path[]"
                                    >
                                    <div class="row image_detail_wrapper">
                                </div>

                                </div>


                                <div class="form-group">
                                    <label>Chọn danh mục</label>
                                    <select class="form-control select2_init @error('category_id') is-invalid @enderror" name="category_id">
                                        <option value="">Chọn danh mục</option>
                                        {!! $htmlOption !!}
                                    </select>
                                    @error('category_id')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror

                                </div>

                                <div class="form-group">
                                    <label>Nhập tags cho sản phẩm</label>
                                    <select name="tags[]" class="form-control tags_select_choose" multiple="multiple">

                                    </select>
                                </div>

                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Nhập nội dung</label>
                                <textarea 
                                    name="contents" 
                                    class="form-control tinymce_editor_init 
                                        @error('contents') is-invalid @enderror" 
                                    rows="15">{{ old('contents') }}
                                </textarea>
                                @error('contents')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                            </div>

                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>

@endsection

@section('js')
 <!-- tk select2 tag -->
    <script src="{{ asset('/vendors/select2/select2.min.js') }}"></script>
    <script src="https://cdn.tiny.cloud/1/dka5jjmo075uz6ic61tn7ofkyec3o1bca3cjbyzv8tr2a3s6/tinymce/5/tinymce.min.js"></script>
    <script src="{{ asset('/admins/product/add/add.js') }}"></script>

@endsection
