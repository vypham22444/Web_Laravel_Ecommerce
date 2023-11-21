@extends('layouts.master')

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

    <!--/#cart_items-->
    <div class="cart_wrapper">
        @include('home.components.cart_components')
    </div>
    <!--/#cart_items-->

@endsection