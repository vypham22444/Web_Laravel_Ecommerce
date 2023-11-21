<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Components\Recusive;
use Illuminate\Support\Str;
use App\Traits\DeleteModelTrait;

class CategoryController extends Controller
{
    use DeleteModelTrait;
    private $category;
    public function __construct(Category $category)
    {
        $this->category = $category; 
    }
    public function create()
    {
        // $data = $this->category->all(); 
        // $recusive = new Recusive($data);
        // $htmlOption = $recusive->categoryRecusive(); thay thế bên dưới
        $htmlOption = $this->getCategory($parentId = '');//parentId = rỗng
        return view ('admin.category.add', compact('htmlOption'));
    }

    public function index()
    {
        $categories = $this->category->latest()->paginate(5); //phân trang, lấy mới nhất lập theo ngày tạo
        return view ('admin.category.index', compact('categories'));
    }

    public function store(Request $REQUEST)
    {
        $this->category->create([
            'name' => $REQUEST->name,
            'parent_id' => $REQUEST->parent_id,
            'slug' => str::slug($REQUEST->name)
        ]);

        return redirect()->route('categories.index');
    }

    public function getCategory($parentId)
    {
        $data = $this->category->all(); 
        $recusive = new Recusive($data);
        $htmlOption = $recusive->categoryRecusive($parentId);
        return $htmlOption;
    }

    public function edit($id)
    {
        $category = $this->category->find($id);
        $htmlOption = $this->getCategory($category->parent_id);
        return view('admin.category.edit',compact('category','htmlOption' ));
    }
    public function update($id,Request $REQUEST)
    {
        $this->category->find($id)->update([
            'name' => $REQUEST->name,
            'parent_id' => $REQUEST->parent_id,
            'slug' => str::slug($REQUEST->name)
        ]);
        return redirect()->route('categories.index');
    }
    public function delete($id)
    {
        // $this->category->find($id)->delete();
        // return redirect()->route('categories.index');
        return $this->deleteModelTrait($id, $this->category);

    }
}
