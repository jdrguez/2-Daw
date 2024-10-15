from django.shortcuts import render

from totask.models import Task

# Create your views here.


def home(request):
    num_task = Task.objects.count()
    tasks = Task.objects.all()
    return render(
        request,
        'totask/home.html',
        {'num_tasks': num_task, 'tasks': tasks},
    )


def task_detail(request, task_slug: str):
    task = Task.objects.get(slug=task_slug)
    return render(request, 'totask/tasks/detail.html', dict(task=task))


def taskdone(request):
    tasks_done = Task.objects.filter(done=True)
    return render(request, 'totask/tasks/done.html', dict(tasks_done=tasks_done))


def pendingtasks(request):
    pending_tasks = Task.objects.filter(done=False)
    return render(request, 'totask/tasks/pending.html', dict(pending_tasks=pending_tasks))


def add_task(request):
    return render(request, 'totask/task/add.html')
