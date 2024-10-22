from django.shortcuts import redirect, render
from django.utils.text import slugify

from .forms import AddTaskForm, EditPostForm
from .models import Task

# Create your views here.


def task_list(request):
    tasks = Task.objects.order_by('done')
    return render(request, 'tasks/task_list.html', dict(tasks=tasks, num_task=tasks.count()))


def complete_tasks(request):
    tasks = Task.objects.filter(done=True)
    title = 'Complete'
    return render(request, 'tasks/task_list.html', dict(tasks=tasks, title=title, complete=True))


def pending_tasks(request):
    tasks = Task.objects.filter(done=False)
    title = 'Pending'
    return render(request, 'tasks/task_list.html', dict(tasks=tasks, title=title, complete=False))


def add_task(request):
    if request.method == 'POST':
        if (form := AddTaskForm(request.POST)).is_valid():
            task = form.save(commit=False)
            task.slug = slugify(task.name)
            print('funciona')
            task.save()
            return redirect('tasks:task-list')
    else:
        form = AddTaskForm()
    return render(request, 'tasks/modifiers/add.html', dict(form=form))


def delete_task(request, task_slug: str):
    task = Task.objects.get(slug=task_slug)
    task.delete()
    return render(request, 'tasks/modifiers/delete.html')


def edit_task(request, task_slug: str):
    task = Task.objects.get(slug=task_slug)

    if request.method == 'POST':
        if (form := EditPostForm(request.POST, instance=task)).is_valid():
            task = form.save(commit=False)

            task.slug = slugify(task.name)

            task.save()

            return redirect('tasks:task-list')

    else:
        form = EditPostForm(instance=task)

    return render(request, 'tasks/modifiers/edit.html', dict(task=task, form=form))


def toggle_status(request, task_slug: str):
    task = Task.objects.get(slug=task_slug)
    task.done = not task.done
    task.save()
    return redirect('tasks:task-list')


def task_detail(request, task_slug: str):
    task = Task.objects.get(slug=task_slug)
    return render(request, 'tasks/task/detail.html', dict(task=task))
