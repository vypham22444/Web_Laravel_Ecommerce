<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Sản phẩm mới nhất</h2>
						@foreach($products as $product)
						<a href="{{route('detail', ['id' => $product->id]) }}" >
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img style="width:150px; height:200px; object-fit: contain"
												 src="{{ asset('') . $product->feature_image_path }}" alt="" />
											<h2>{{ number_format($product->price) }} VNĐ</h2>
											<p>{{ $product->name }}</p>
											<a href="{{route('detail', ['id' => $product->id]) }}" 
												data-url="{{route('addToCart', ['id' => $product->id]) }}"
												class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart
											</a>
										</div>
										
								</div>
								
							</div>
						</div>
						</a>
						@endforeach
						
					</div>