@dir = '/data/app/'

worker_processes 1
working_directory @dir

timeout 30

listen '/var/run/unicorn.sock', backlog:  64

stderr_path '/dev/stderr'
stdout_path '/dev/stdout'
