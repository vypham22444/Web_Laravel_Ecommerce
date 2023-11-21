<?php

namespace App\Http\Controllers;
use Session;
use Cart;
use Illuminate\Support\Facades\Redirect;

use Illuminate\Http\Request;
use App\Models\Slider;
use App\Models\Category;
use App\Models\Product;
use App\Models\Setting;
use App\Models\Comment;
use App\Models\Customer;
use App\Models\Shipping;
use App\Models\Order;
use App\Models\OrderDetails;

session_start();
class HomeController extends Controller
{
    public function index()
    {
        $sliders = Slider::latest()->get(); // lấy cái mới nhất và lấy tất cả
        $categorys = Category::where('parent_id', 0)->get();
        $products = Product::latest('id', 'desc')->take(9)->get();
        $productsRecommend = Product::latest('views_count', 'desc')->take(6)->get(); // lấy views_count theo thứ tự lớn
        $categorysLimit = Category::where('parent_id', 0)->take(3)->get();
        return view('home.home', compact('sliders', 'categorys','products','productsRecommend', 'categorysLimit'));
    }

    public function indexcategory($slug, $categoryId)
    {
        $categorysLimit = Category::where('parent_id', 0)->take(3)->get();
        $products = Product::where('category_id', $categoryId)->paginate(6);
        $categorys = Category::where('parent_id', 0)->get();
        return view('nd_product.category.list', compact('categorysLimit', 'products','categorys'));
    }

    public function addToCart($id)
    {
        $products = Product::find($id);
        $cart = session()->get('data');

        if( isset($data )){
            $data['qty'] = $data['qty'] + 1;
        } else {
            $data['id'] = $products->id;
            $data['qty'] = 1;
            $data['name'] = $products->name;
            $data['price'] = $products->price;
            $data['weight'] = 123;
            $data['options']['image'] = $products->feature_image_path;
            Cart::add($data);
        }
        session()->put('data', $data);
        return response()->json([
            'code' => 200,
            'message' => 'ok'
        ], 200);



        // session()->foreach('cart');
        // print_r(session()->get('cart'));
        // dd('end');
        // session()->flush();
        // $products = Product::find($id);
        // $cart = session()->get('cart');
        // if( isset($cart[$id]) ){
        //     $cart[$id]['quantity'] = $cart[$id]['quantity'] + 1;
        // } else {
        //     $cart[$id] = [
        //         'name' => $products->name,
        //         'price' => $products->price,
        //         'quantity' => 1,
        //         'image' => $products->feature_image_path
        //     ];
        // }
        // session()->put('cart', $cart);
        // return response()->json([
        //     'code' => 200,
        //     'message' => 'ok'
        // ], 200);
    }

    public function showCart(Request $REQUEST)
    {
        // echo "<pre>";
        //print_r(session()->get('cart'));
        $categorysLimit = Category::where('parent_id', 0)->take(3)->get();
        $categorys = Category::where('parent_id', 0)->get();
        $carts = session()->get('data');
        return view('home.cart', compact('categorysLimit','categorys','carts'));
    }

    public function updateCart(Request $REQUEST)
    {
        $rowId = $REQUEST->rowId;
        $qty = $REQUEST->quantity;
        Cart::update($rowId, $qty);
        return redirect()->route('showCart');
        // if($REQUEST->id && $REQUEST ->quatity){
        //     $carts = session()->get('cart');
        //     $carts[$REQUEST->id]['quantity'] = $REQUEST->quatity;
        //     session()->put('cart', $carts);
        //     $carts = session()->get('cart');
        //     $cartComponent = view('home.components.cart_components', compact('carts'))->render();// trả về 1 cái html
        //     return response()->json([
        //         'cart_components' => $cartComponent,
        //         'code' => 200
        //     ], 200);
        // }

    }

    public function deleteCart($rowId)
    {
        Cart::update($rowId, 0); 
        return redirect()->route('showCart');
        // if($REQUEST->rowId){
        //     $carts = session()->get('cart');
        //     Cart::update($rowId, 0);
        //     session()->put('cart', $carts);
        //     $carts = session()->get('cart');
        //     $cartComponent = view('home.components.cart_components', compact('carts'))->render();// trả về 1 cái html
        //     return response()->json([
        //         'cart_components' => $cartComponent,
        //         'code' => 200
        //     ], 200);
        // }
    }

    public function detail($id)
    {
        $data['products'] = Product::find($id);
        $data['categorysLimit'] = Category::where('parent_id', 0)->take(3)->get();
        $data['categorys'] = Category::where('parent_id', 0)->get();
        $data['comments'] = Comment::where('product_id', $id)->get();
        $category_id = $data['products']->category_id;
        $data['productsRecommend'] = Product::join('categories','categories.id',"=",'products.category_id')
            ->where('categories.id',$category_id)->whereNotIn('products.id',[$id])->get();
        return view('home.detail', $data);
    }

    public function postComment(Request $REQUEST,$id)
    {
        $comment = new Comment;
        $comment->name = $REQUEST->name;
        $comment->email = $REQUEST->email;
        $comment->comment = $REQUEST->comment;
        $comment->product_id = $id;
        $comment->save();
        return back();
    }

    public function search(Request $request)
    {
        $search = $request->search;
        $data['keyword'] = $search;
        $search = str_replace(' ','%', $search); // khi tìm kiếm đổi khoảng trắng thành dấu %
        $data['items'] = Product::where('name', 'like', '%'.$search.'%')->get();
        $data['categorysLimit'] = Category::where('parent_id', 0)->take(3)->get();
        return view('nd_product.search', $data);

    }

    //Đăng kí
    public function loginCheckout()
    {
        $categorysLimit = Category::where('parent_id', 0)->take(3)->get();
        return view('home.login_Checkout', compact('categorysLimit'));
    }

    //Đăng xuất
    public function logoutCheckout()
    {
        Session::flush();
        return redirect()->route('loginCheckout');

    }

    //Đăng nhập
    public function loginCustomer(Request $request)
    {
        $email = $request->email_account;
        $password = md5($request->password_account);
        $result = Customer::where('email',$email)->where('password',$password)->first();

        if($result){
            Session::put('id',$result->id);
            return redirect()->route('payment');
        }else{
            return redirect()->route('loginCheckout');
        }

    }

    public function add_customer(Request $request)
    {
        $data = array();
        $data['name'] = $request->name;
        $data['email'] = $request->email;
        $data['password'] = md5($request->password);
        $data['phone'] = $request->phone;

        $customer_id = Customer::insertGetId($data);

        Session::put('id',$customer_id);
        Session::put('name',$request->name);

        return redirect()->route('payment');
    }

    public function checkout()
    {

        $categorysLimit = Category::where('parent_id', 0)->take(3)->get();
        $categorys = Category::where('parent_id', 0)->get();
        $carts = session()->get('cart');
        return view('home.checkout', compact('categorysLimit','categorys','carts'));
    }

    public function save_customer_checkout(Request $request)
    {
        $data = array();
        $data['name'] = $request->name;
        $data['email'] = $request->email;
        $data['address'] = $request->address;
        $data['phone'] = $request->phone;
        $data['notes'] = $request->notes;

        $shipping_id = Shipping::insertGetId($data);

        Session::put('id',$shipping_id);

        return redirect()->route('payment');
    }

    public function payment()
    {
        $categorysLimit = Category::where('parent_id', 0)->take(3)->get();
        $categorys = Category::where('parent_id', 0)->get();
        $carts = session()->get('cart');
        return view('home.payment', compact('categorysLimit','categorys','carts'));
    }

    public function orderPlace(Request $request){
        // $ct = Cart::content();
        // echo $ct;
        $data = $request->all();
        $shipping = new Shipping();
        $shipping->name = $data['name'];
        $shipping->email = $data['email'];
        $shipping->address =  $data['address'];
        $shipping->phone = $data['phone'];
        $shipping->notes = $data['notes'];
        $shipping->save();
        $shipping_id = $shipping->id;

        $checkout_code = substr(md5(microtime()),rand(0,26),5);//tạo ra random chữ vs số, lấy 5

        $order = new Order;
        $order->customer_id = Session::get('id');
        $order->shipping_id = $shipping_id;
        $order->order_code = $checkout_code;
        $order->status = 1;
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $order->created_at = now();
        $order->save();
        
        // echo "<pre>";
        // print_r(session()->get('cart'));
        $content = Cart::content();
        if(session()->get('cart')==true){
            foreach($content as $cart){
                $order_details = new OrderDetails;
                $order_details->order_code = $checkout_code;
                $order_details->product_id = $cart->id;
                $order_details->product_name = $cart->name;
                $order_details->product_price = $cart->price;
                $order_details->product_sales_quatity = $cart->qty;
                $order_details->save();

            }
        }
        Cart::destroy();
        return back();
    }
}
