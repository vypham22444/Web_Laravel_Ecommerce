<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i>{{ getConfigValueFromSettingTable('phone') }}</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>{{ getConfigValueFromSettingTable('email') }}</a></li>
							</ul>
						</div>
					</div>
					<!-- <div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="{{ getConfigValueFromSettingTable('link_shopee') }}"><i class="fa fa-facebook"></i></a></li>
								<li><a href="{{ getConfigValueFromSettingTable('shopee_key') }}"><i class="fa fa-twitter"></i></a></li>
							</ul>
						</div>
					</div> -->
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-md-4 clearfix">
						<div class="logo pull-left">
							<a href=""><img  src="" alt="" />SHOP VY</a>
						</div>
				
					</div>
					<div class="col-md-8 clearfix">
						<div class="shop-menu clearfix pull-right">
							<ul class="nav navbar-nav">

								<?php
									$customer_id = Session::get('id');
									$shipping_id = Session::get('id');
									if($customer_id != NULL){
								?>
									<!-- <li><a href="{{ route('checkout') }}"><i class="fa fa-crosshairs"></i> Thanh toán</a></li> -->
								<?php
									// }elseif($customer_id != NULL && $shipping_id != NULL){
								?>
									<li><a href="{{ route('payment') }}"><i class="fa fa-crosshairs"></i> Thanh toán</a></li>
								<?php
									}elseif($customer_id == NULL){
								?>
									<li><a href="{{ route('loginCheckout') }}"><i class="fa fa-crosshairs"></i> Thanh toán</a></li>
								<?php
									}
								?>
								
								<li><a href="{{ route('showCart') }}"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
								
								<?php
									$customer_id = Session::get('id');
									if($customer_id != NULL){
								?>
									<li><a href="{{ route('logoutCheckout') }}"><i class="fa fa-lock"></i> Đăng xuất</a></li>
								<?php
									}else{
								?>
									<li><a href="{{ route('loginCheckout') }}"><i class="fa fa-lock"></i> Đăng nhập</a></li>
								<?php
									}
								?>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>

						@include('components.main_menu')

					</div>

					<div class="col-sm-3">

						<!-- SEARCH FORM -->
						<form class="form-inline pull-right" method="get" action="{{route('search')}}">

							<div class="form-group mx-sm-2 mb-2">
								<input type="text"
									class="form-control" placeholder="tìm kiếm sản phẩm" name="search">
							</div>
							<button type="submit" class="btn mx-sm-2 mb-2">Search</button>
						</form>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->