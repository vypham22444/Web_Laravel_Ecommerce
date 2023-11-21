<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Shipping;
use App\Models\Order;
use App\Models\Product;
use App\Models\OrderDetails;

class OrderController extends Controller
{
    public function index(){
        $all_order = Order::orderby('created_at','desc')->paginate(10);
        return view('admin.order.index', compact('all_order'));
    }

    public function viewOrder($orderCode){
        // $data['customer_id'] = Order::join('customers','orders.customer_id',"=",'customers.id')->find($orderId);
        // $data['shipping_id'] = Order::join('shippings','orders.shipping_id',"=",'shippings.id')->find($orderId);
        // $data['order_id'] = Order::join('customers','orders.customer_id',"=",'customers.id')
        //     ->join('shippings','orders.shipping_id',"=",'shippings.id')
        //     ->join('order_details','orders.order_code',"=",'order_details.order_code')
        //     ->select('orders.*','customers.*','shippings.*','order_details.*')
        //     ->orderby('orders.id','desc')->where('orders.id',$orderId)->get();
      
        //dd($data);

        $order_detail = OrderDetails::with('product')->where('order_code',$orderCode)->get();
        $order = Order::where('order_code',$orderCode)->get();
        foreach($order as $key => $orders){
            $customer_id = $orders->customer_id;
            $shipping_id = $orders->shipping_id;
            $status = $orders->status;
        }
        $customer = Customer::where('id',$customer_id)->first();
        $shipping = Shipping::where('id',$shipping_id)->first();

        return view('admin.order.view', compact('order_detail', 'customer', 'shipping','order','status'));
    }

    public function update_order_qty(Request $REQUEST)
    {
        //update order
		$data = $REQUEST->all();
		$order = Order::find($data['order_id']);
		$order->status = $data['order_status'];
		$order->save();
        dd('order');
    }
}
