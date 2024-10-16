from django.shortcuts import redirect, render
from django.utils.text import slugify

from .forms import AddTaskForm
from .models import Task

# Create your views here.


def task_list(request):
    tasks = Task.objects.order_by('done')
    return render(request, 'tasks/home.html', dict(tasks=tasks))


def complete_tasks(request):
    tasks = Task.objects.filter(done=True)
    title = 'Complete'
    return render(request, 'tasks/list_task.html', dict(tasks=tasks, title=title))


def pending_tasks(request):
    tasks = Task.objects.filter(done=False)
    title = 'Pending'
    return render(request, 'tasks/list_task.html', dict(tasks=tasks, title=title))


def add_task(request):
    if request.method == 'POST':
        if (form := AddTaskForm(request.POST)).is_valid():
            task = form.save(commit=False)
            task.slug = slugify(task.title)
            print('funciona')
            task.save()
            return redirect('tasks:task-list')
    else:
        form = AddTaskForm()
    return render(request, 'tasks/add.html', dict(form=form))


def task_detail(request, task_slug: str):
    task = Task.objects.get(slug=task_slug)
    return render(request, 'tasks/task/detail.html', dict(task=task))
