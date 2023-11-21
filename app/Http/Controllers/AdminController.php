<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
use Illuminate\Http\Request;
use \Auth;
use \Session;

use Illuminate\Validation\ValidationException;
use App\Models\Slider;
use App\Models\Category;
use App\Models\Product;
use App\Models\Setting;
use App\Models\Comment;
use App\Models\Customer;
use App\Models\Shipping;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\ThongKe;

class AdminController extends Controller
{
    public function loginAdmin()
    {
        //dd(bcrypt('vypham@gmail.com', vypham));
        if (Auth::check()) {
            return redirect()->to('homes');
        }

        return view('login');
    }

    public function logout()
    {
        auth()->logout();
        return redirect()->route('admin.login');
    }


    public function postLoginAdmin(Request $request)
    {
        // $this->validate($REQUEST, [
        //     'email' => 'required|email:filter', // k dc trống va phai đúng email
        //     'password' => 'required'
        // ]);

        // if(Auth::attempt([
        //         'email' => $REQUEST->input('email'),
        //         'password' => $REQUEST->input('password'), // khop vs data thi cho vao
        //         //'level' =>1 //cho admin là level 1, nhưng người khác level 2, thêm vào data nếu level 1 thì cho vào
        //     ], $REQUEST->input('remember'))) {
            
        //     return redirect()->route('admin'); // chi den route co name admin
        // }

        // session::flash('error','Email hoặc password khong dung'); // thong bao loi 
        // // có thể đổi thành session()->flash('error', 'email hoặc mật khẩu không chính xác');
        // return redirect()->back();


        $remember = $request->has('remember_me') ? true : false;
        $this->validate($request, [
            'email' => 'required|email:filter', // k dc trống va phai đúng email
            'password' => 'required'
        ]);

        if (Auth::attempt([
            'email' => $request->email,
            'password' => $request->password
        ], $remember)) {
            return redirect()->to('homes');
        }else
        {
            session::flash('error','Email hoặc password khong dung');
            return redirect('admin');
        }

    }

    public function index(){
        $product_count = Product::count();
        $order_count = Order::count();
        $category_count = Category::count();
        return view('homes', compact('product_count','order_count','category_count'));
    }

    public function locNgay(Request $request){
        $data = $request->all();
		$tu_ngay = $data['tu_ngay'];
		$den_ngay = $data['den_ngay'];

        $ngay = ThongKe::whereBetween('ngay_order',[$tu_ngay,$den_ngay])->orderby('ngay_order','ASC')->get();

        foreach($ngay as $key => $val){
            $chart_data[] = array(
                'ngay' => $val->ngay_order,
                'doanhso' => $val->doanh_so,
                'quantity' => $val->quantity,
                'tong' => $val->tong_order
            );
        }

        echo $data = json_encode($chart_data);
    }

    public function chonLoc(Request $request){
        $data = $request->all();
        $today = Carbon::now('Asia/Ho_Chi_Minh')->format('m-d-Y H:i:s');

        $dauthangnay = Carbon::now('Asia/Ho_Chi_Minh')->startOfMonth()->toDateString();
        $dau_thang_truoc = Carbon::now('Asia/Ho_Chi_Minh')->subMonth()->startOfMonth()->toDateString();
        $cuoi_thang_truoc = Carbon::now('Asia/Ho_Chi_Minh')->subMonth()->endOfMonth()->toDateString();

        $lay7ngay = Carbon::now('Asia/Ho_Chi_Minh')->subdays(7)->toDateString();
        $lay365ngay = Carbon::now('Asia/Ho_Chi_Minh')->subDays(365)->toDateString();

        $now = Carbon::now('Asia/Ho_Chi_Minh')->toDateString();

        if($data['hinh_thuc']=='7ngay'){
            $ngay = ThongKe::whereBetween('ngay_order',[$lay7ngay,$now])->orderby('ngay_order','ASC')->get();
        }

        elseif($data['hinh_thuc']=='thangtruoc'){
            $ngay = ThongKe::whereBetween('ngay_order',[$dau_thang_truoc,$cuoi_thang_truoc])->orderby('ngay_order','ASC')->get();
        }

        elseif($data['hinh_thuc']=='thangnay'){
            $ngay = ThongKe::whereBetween('ngay_order',[$dauthangnay,$now])->orderby('ngay_order','ASC')->get();
        }

        else{
            $ngay = ThongKe::whereBetween('ngay_order',[$lay365ngay,$now])->orderby('ngay_order','ASC')->get();
        }

        foreach($ngay as $key => $val){
            $chart_data[] = array(
                'ngay' => $val->ngay_order,
                'doanhso' => $val->doanh_so,
                'quantity' => $val->quantity,
                'tong' => $val->tong_order
            );
        }

        echo $data = json_encode($chart_data);

    }

}
