@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="">
                                All Tasks
                            </div>
                            <div class="">
                                <a href="{{ route('task.create') }}" class="btn btn-primary btn-sm">Add New Task</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form method="GET" action="{{ route('task.index') }}">
                            <div class="row d-flex align-items-center">
                                <div class="col-lg-6 col-xl-3">
                                    <label for="" class="form-label">Status</label>
                                    <select name="status" class="form-control form-select shadow-none"
                                        onchange="this.form.submit()">
                                        <option value="">All</option>
                                        <option value="Pending" {{ request('status') == 'Pending' ? 'selected' : '' }}>
                                            Pending</option>
                                        <option value="In Progress"
                                            {{ request('status') == 'In Progress' ? 'selected' : '' }}>In Progress</option>
                                        <option value="Completed" {{ request('status') == 'Completed' ? 'selected' : '' }}>
                                            Completed</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 col-xl-3">
                                    <label for="" class="form-label">Date</label>
                                    <select name="sort_by" class="form-control shadow-none form-select"
                                        onchange="this.form.submit()">
                                        <option value="">Default</option>
                                        <option value="due_date" {{ request('sort_by') == 'due_date' ? 'selected' : '' }}>
                                            Due Date
                                        </option>
                                    </select>
                                </div>
                                <div class="col-5">
                                    @if (Request::get('status') || Request::get('sort_by'))
                                        <div class="mt-4">
                                            <a href="{{ route('task.index') }}" class="btn btn-sm btn-danger">Clear</a>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </form>

                        <div class="table-responsive mt-4">
                            <table class="table table-striped align-middle">
                                <thead>
                                    <tr>
                                        <th>Sl</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                        <th>Due Date</th>
                                        <th style="width:20%;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse ($tasks as $task)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $task->title }}</td>
                                            <td>{{ Str::limit($task->description, 50) }}</td>
                                            <td>
                                                <span
                                                    class="badge 
                                            @if ($task->status == 'Pending') bg-warning 
                                            @elseif($task->status == 'In Progress') 
                                                bg-primary 
                                            @else 
                                                bg-success @endif">
                                                    {{ $task->status }}
                                                </span>
                                            </td>
                                            <td>
                                                @if (isset($task->due_date))
                                                    {{ date('M d, Y', strtotime($task->due_date)) }}
                                                @else
                                                    N/A
                                                @endif
                                            </td>

                                            <td>
                                                <a href="{{ route('task.view', $task->id) }}"
                                                    class="btn btn-sm btn-primary btn-sm p-2">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-eye"><path d="M2.062 12.348a1 1 0 0 1 0-.696 10.75 10.75 0 0 1 19.876 0 1 1 0 0 1 0 .696 10.75 10.75 0 0 1-19.876 0"/><circle cx="12" cy="12" r="3"/></svg>
                                                </a>
                                                <a href="{{ route('task.edit', $task->id) }}"
                                                    class="btn btn-sm btn-secondary btn-sm p-2">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pencil"><path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"/><path d="m15 5 4 4"/></svg>
                                                </a>
                                                <a href="{{ route('task.destroy', $task->id) }}"
                                                    onclick="return confirm('Are you sure to Delete Task?')"
                                                    class="btn btn-sm btn-danger p-2">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-2"><path d="M3 6h18"/><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"/><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"/><line x1="10" x2="10" y1="11" y2="17"/><line x1="14" x2="14" y1="11" y2="17"/></svg>
                                                </a>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="6" class="text-center">Data Not Found</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
