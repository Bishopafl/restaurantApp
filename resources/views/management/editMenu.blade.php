@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                @include('management.inc.sidebar')
            </div>
            <div class="col-md-8">
                <i class="fas fa-utensils"></i> Edit a Menu
                <hr>
                @if($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                           @foreach($errors->all() as $error) 
                                <li>{{$error}}</li>
                           @endforeach
                        </ul>
                    </div>
                @endif
                <form action="/management/menu/{{$menu->id}} " class="" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label for="menuName">Menu Name</label>
                        <input type="text" name="name" value="{{$menu->name}}" class="form-control" placeholder="Menu...">
                    </div>
                    <label for="menuPrice">Price</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">$</span>
                        </div>
                        <input type="text" name="price" value="{{$menu->price}}" class="form-control" aria-label="Amount(to the nearest dollar)">
                    </div>
                    <label for="MenuImage">Image</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Upload Menu Image</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" name="image" class="custom-file-input" id="inputGroupFile01">
                            <label for="inputGroupFile01" class="custom-file-label">Choose File</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" name="description" value="{{$menu->description}}" class="form-control" placeholder="Description...">
                    </div>

                    <div class="form-group">
                        <label for="category">Category</label>
                        <select name="category_id" id="" class="form-control">
                            @foreach ($categories as $category)
                                <option value="{{$category->id}}" {{$menu->category_id === $category->id ? 'selected' : ''}} >{{$category->name}}</option>
                            @endforeach
                        </select>
                    </div>

                    <button type="submit" class="btn btn-warning">Edit</button>
                </form>
            </div>
        </div>
    </div>
@endsection