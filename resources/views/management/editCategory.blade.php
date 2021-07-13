@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="list-group">
                    <a class="list-group-item list-group-item-action" href="/management/category"><i class="fas fa-align-justify"></i> Category</a>
                    <a class="list-group-item list-group-item-action" href="#"><i class="fas fa-utensils"></i> Menu</a>
                    <a class="list-group-item list-group-item-action" href="#"><i class="fas fa-chair"></i> Table</a>
                    <a class="list-group-item list-group-item-action" href="#"><i class="fas fa-user-cog"></i> User</a>
                </div>
            </div>
            <div class="col-md-8">
                <i class="fas fa-align-justify"></i> Edit Category
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
                <form action="/management/category/{{$category->id}}" class="" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label for="categoryName">Category Name</label>
                        <input type="text" value="{{$category->name}}" name="name" class="form-control" placeholder="Category...">
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
@endsection