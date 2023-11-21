<div class="product-details"><!--product-details-->
    <div class="col-sm-5">
        <div class="view-product">
            <img src="{{ asset('') . $products->feature_image_path }}" alt="" />
            <h3></h3>
        </div>
        <!-- <div id="similar-product" class="carousel slide" data-ride="carousel">
            
                <div class="carousel-inner">
                    <div class="item active">
                        <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
                    </div>
                    <div class="item">
                        <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
                    </div>
                    <div class="item">
                        <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
                    </div>
                    
                </div>

               
                <a class="left item-control" href="#similar-product" data-slide="prev">
                <i class="fa fa-angle-left"></i>
                </a>
                <a class="right item-control" href="#similar-product" data-slide="next">
                <i class="fa fa-angle-right"></i>
                </a>
        </div> -->

    </div>
    <div class="col-sm-7">
        <div class="product-information"><!--/product-information-->
            <h2>{{$products->name}}</h2>
            <p>Web ID: {{$products->id}}</p>
            <span>
                <span>{{ number_format($products->price) }} VNĐ</span>
                <!-- <label>Quantity:</label>
                <input type="number" value="1" min="1" /> -->
                <button type="button" 
                    data-url="{{route('addToCart', ['id' => $products->id]) }}"
                    class="btn btn-fefault add-to-cart">
                    <i class="fa fa-shopping-cart"></i>
                    Add to cart
                </button>
            </span>
            <p><b>Tình trạng: </b>Còn {{$products->product_quantity}} sản phẩm</p>
            <p><b>Danh mục: </b>{{ optional($products->category)->name }}</p>
            <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
        </div><!--/product-information-->
    </div>
</div><!--/product-details-->



<div class="category-tab shop-details-tab"><!--category-tab-->
    <div class="col-sm-12">
        <ul class="nav nav-tabs">
            <li><a href="#details" data-toggle="tab">Ảnh chi tiết</a></li>
            <li><a href="#companyprofile" data-toggle="tab">Thông Tin Chi Tiết</a></li>
            <li class="active"><a href="#reviews" data-toggle="tab">Reviews (5)</a></li>
        </ul>
    </div>
    <div class="tab-content">
        <div class="tab-pane fade" id="details" >
            @foreach($products->productImages as $producImageItem)
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img style="width:150px; height:200px; object-fit: contain"
                            src="{{ asset('/') . $producImageItem->image_path }}" alt="" />
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
        
        <div class="tab-pane fade" id="companyprofile" >
            <p>{!!$products->content!!}</p>
        </div>
        
        
        <div class="tab-pane fade active in" id="reviews" >
            <div class="col-sm-12">
                @foreach($comments as $comment)
                <ul>
                    <li><a href=""><i class="fa fa-user"></i>{{$comment->name}}</a></li>
                    <li><a href=""><i class="fa fa-clock-o"></i>{{date('H:i',strtotime($comment->created_at))}}</a></li>
                    <li><a href=""><i class="fa fa-calendar-o"></i>{{date('d/m/Y',strtotime($comment->created_at))}}</a></li>
                </ul>
                <p>{{$comment->comment}}</p>
                @endforeach

                <p><b>Write Your Review</b></p>
                <form method="post" action="">
                    <span>
                        <input type="text" name="name" placeholder="Your Name"/>
                        <input type="email" name="email" placeholder="Email Address"/>
                    </span>
                    <textarea name="comment" ></textarea>
                    <b>Rating: </b> 
                    <button type="submit" class="btn btn-default pull-right">
                        Submit
                    </button>
                    {{csrf_field()}}
                </form>
            </div>
        </div>
        
    </div>
</div><!--/category-tab-->
<div class="recommended_items"><!--recommended_items-->
    <h2 class="title text-center">Các mục được đề xuất</h2>
    
    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            @foreach($productsRecommend as $keyRecommend => $productsRecommendItem )
        
                @if($keyRecommend % 2 == 0)
                    <div class="item {{$keyRecommend == 0 ? 'active' : '' }}">
                @endif	
                <a href="{{route('detail', ['id' => $productsRecommendItem->id]) }}" >
                        <div class="col-sm-6">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        
                                        <img style="width:150px; height:200px; object-fit: contain"
                                            src="{{ asset('') . $productsRecommendItem->feature_image_path }}" alt="" />
                                        <h2>{{ number_format($productsRecommendItem->price) }}</h2>
                                        <p>{{ $productsRecommendItem->name }}</p>
                                        
                                        <a href="" 
                                            data-url="{{route('addToCart', ['id' => $productsRecommendItem->id]) }}"
                                            class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </a>

                @if($keyRecommend % 2 == 1)
                    </div>
                @endif
            
            @endforeach

        </div>
            <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
            <i class="fa fa-angle-left"></i>
            </a>
            <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
            <i class="fa fa-angle-right"></i>
            </a>			
    </div>
</div>