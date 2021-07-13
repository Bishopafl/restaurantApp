@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                @include('management.inc.sidebar')
            </div>
            <div class="col-md-8">
                <i class="fas fa-user"></i> Create a User
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
                <form action="/management/user" class="" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Enter user name">
                    </div>
                    <div class="form-group">
                        <label for="email">email</label>
                        <input type="email" name="email" class="form-control" placeholder="Enter user email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Enter user password">
                    </div>
                    <div class="form-group">
                        <label for="Role">Role</label>
                        <select name="role" class="form-control" id="">
                            <option value="admin">Admin</option>
                            <option value="cashier">Cashier</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
@endsection