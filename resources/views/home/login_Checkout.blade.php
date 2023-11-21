@extends('layouts.master')

@section('title')
    <title>Login</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('home/home.css') }}">
@endsection

@section('js')
	<script type="text/javascript" src="{{asset('home/home.js') }}"></script>
@endsection

@section('content')

<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Đăng nhập vào tài khoản của bạn</h2>
						<form action="{{ route('loginCustomer') }}" method="POST">
							{{csrf_field()}}
							<input type="text" name="email_account" placeholder="Tài khoản" />
							<input type="password" name="password_account" placeholder="Password" />
							<span>
								<input type="checkbox" class="checkbox"> 
								Ghi Nhớ đăng nhập
							</span>
							<button type="submit" class="btn btn-default">Đăng nhập</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">HOẶC</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>Đăng ký người dùng mới!</h2>
						<form action="{{ route('add_customer') }}" method="POST">
                            {{csrf_field()}}
							<input type="text" name="name" placeholder="Họ và Tên"/>
							<input type="email" name="email" placeholder="Địa chỉ email"/>
							<input type="password" name="password" placeholder="Mật khẩu"/>
                            <input type="text" name="phone" placeholder="số điện thoại"/>
							<button type="submit" class="btn btn-default">Đăng kí</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->

@endsection