<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TaskController extends Controller
{ 
    public function index(Request $request)
    {
        $query = Task::where('user_id', auth()->id());
        if ($request->has('status') && in_array($request->status, ['Pending', 'In Progress', 'Completed'])) {
            $query->where('status', $request->status);
        }

        if ($request->has('sort_by') && $request->sort_by === 'due_date') {
            $query->orderBy('due_date', 'asc');
        }
        $tasks = $query->get();
        return view('tasks.index', compact('tasks'));
    }

    public function create()
    {
        return view('tasks.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title'         => 'required|string|max:255',
            'description'   => 'nullable|string',
            'status'        => 'required',
            'due_date'      => 'nullable|date',
        ]);
        try {
            $task               = new Task();
            $task->title        = $request->title;
            $task->status       = $request->status;
            $task->description  = $request->description;
            $task->due_date     = $request->due_date;
            $task->user_id      = Auth::user()->id;
            $task->save(); 
            return redirect()->route('task.index')->with('notify', [['success', 'Task created successfully.']]);
        } catch (\Throwable $th) {  
            return redirect()->back()->with('notify', [['error', 'There was an error creating the task.']]);
        }
    }

    public function view($id)
    {
        $task = Task::findOrFail($id);
        return view('tasks.view', compact('task'));
    }


    public function edit($id)
    {
        $task = Task::findOrFail($id);
        return view('tasks.edit', compact('task'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title'         => 'required|string|max:255',
            'description'   => 'nullable|string',
            'status'        => 'required',
            'due_date'      => 'nullable|date',
        ]);
        try {
            $task               = Task::find($id);
            $task->title        = $request->title;
            $task->status       = $request->status;
            $task->description  = $request->description;
            $task->due_date     = $request->due_date;
            $task->user_id      = Auth::user()->id;
            $task->update();
            return redirect()->route('task.index')->with('notify', [['success', 'Task updated successfully.']]);
        } catch (\Throwable $th) {
            return redirect()->route('task.index')->with('error', 'There was an error creating the task.');
        }
    }

    public function destroy($id)
    { 
        try {
            Task::findOrFail($id)->delete(); 
            return redirect()->back()->with('notify', [['success', 'Task deleted successfully.']]);
        } catch (\Throwable $th) {
            return redirect()->back()->with('notify', [['error', 'There was an error delete the task.']]);
        }
    }
}
