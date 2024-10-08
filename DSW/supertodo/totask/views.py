from django.shortcuts import render

from totask.models import Task

# Create your views here.


def home(request):
    num_task = Task.objects.count()
    tasks = Task.objects.all()
    return render(
        request,
        'totask/home.html',
        {'num_task': num_task, 'tasks': tasks},
    )


def task_detail(request, task_slug: str):
    task = Task.objects.get(slug=task_slug)
    return render(request, 'totask/tasks/detail.html', dict(task=task))
