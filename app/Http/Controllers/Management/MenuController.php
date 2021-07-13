<?php

namespace App\Http\Controllers\Management;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Category; // access category model
use App\Menu; // access menu model

class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $menus = Menu::all();
        return view('management.menu')->with('menus', $menus);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        return view('management.createMenu')->with('categories',  $categories);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:menus|max:255',
            'price' => 'required|numeric',
            'category_id' => 'required|numeric'
        ]);

        // if a user doesn't upload an image
        // use noimage.png for the menu
        $imageName = "noimage.png";
        // If a user uploads an image
        if ($request->image) {
            //validate the image
            $request->validate([
                'image' => 'nullable|file|image|mimes:jpeg,png,jpg|max:5000'
            ]);
            $imageName = date('mdYHis').uniqid().'.'.$request->image->extension(); // extension of the image uploaded, use date/time and then encrypt
            $request->image->move(public_path('menu_images'), $imageName);
        }
        // save information to menu table
        $menu = new Menu();
        $menu->name = $request->name;
        $menu->price = $request->price;
        $menu->image = $imageName;
        // dd($imageName);
        $menu->description = $request->description;
        $menu->category_id = $request->category_id;
        $menu->save();
        $request->session()->flash('status', $request->name. ' is saved successfully.');
        
        return redirect('/management/menu');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $menu = Menu::find($id);
        $categories = Category::all();
        return view('management.editMenu')->with('menu', $menu)->with('categories', $categories);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // Update info in database
        // --------
        // information validation
        $request->validate([
            'name' => 'required|max:255',
            'price' => 'required|numeric',
            'category_id' => 'required|numeric'
        ]);
        $menu = Menu::find($id);
        // validate if user uploaded an image
        if ($request->image) {
            $request->validate([
                'image' => 'nullable|file|image|mimes:jpeg,png,jpg|max:6000'
            ]);
            // checks if image name is different than no image,
            // if the image name is different, the image will be deleted
            if ($menu->image != "noimage.png") {
                $imageName = $menu->image;
                unlink(public_path('menu_images').'/'.$imageName); // deletes old image
            }
            $imageName = date('mdYHis').uniqid().'.'.$request->image->extension(); // creates new image to save
            $request->image->move(public_path('menu_images'), $imageName); // move the new image to menu_images folder with the new image name
        } else {
            $imageName = $menu->image;
        }
        $menu->name = $request->name;
        $menu->price = $request->price;
        $menu->image = $imageName;
        $menu->description = $request->description;
        $menu->category_id = $request->category_id;
        $menu->save();
        $request->session()->flash('status', $request->name. ' is updated successfully.');
        return redirect('/management/menu');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Delete a menu 
        $menu = Menu::find($id);
        if ($menu->image != "noimage.png") {
            unlink(public_path('menu_images').'/'.$menu->image);
        }
        $menuName = $menu->name;
        $menu->delete();
        session()->flash('status', $menuName. " is deleted successfully.");
        return redirect('/management/menu');
    }
}
