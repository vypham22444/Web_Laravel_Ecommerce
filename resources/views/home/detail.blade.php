@extends('layouts.master')
<link href="css/responsive.css" rel="stylesheet">
@section('title')
    <title>Home page</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('home/home.css') }}">
@endsection

@section('js')
	 <script type="text/javascript" src="{{asset('home/home.js') }}"></script> 
@endsection

@section('content')
<section>
		<div class="container">
			<div class="row">
                @include('components.sidebar')
				
				<div class="col-sm-9 padding-right">

					<!--product-details-->
					@include('home.components.detail_product')
					
				</div>
			</div>
	</div>
</section>


@endsection