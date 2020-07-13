# steps to reproduce

You can launch 3 servers at the same time and check the different URLs which are marked with
- "ok" : only one leading slash in `request.path`
- "not ok" : two leading slash in `request.path`

- `rails s` (ok)

  - http://localhost:3000/app/yolo (ok)
  > [app] request.path : /app/yolo

- `ENGINE=api rails s -p 4000 -P tmp/pids/server_api.pid`

  - http://localhost:4000/app/yolo (not ok)
  > [app] request.path : //app/yolo

  - http://localhost:4000/engines/api/yolo (ok)
  > [engine] request.path : /engines/api/yolo

N.B: I could not reproduce the error in a controller in the engine

- `ENGINE=backoffice rails s -p 5000 -P tmp/pids/server_bo.pid`

  - http://localhost:5000/app/yolo (not ok)
  > [app] request.path : //app/yolo

  - http://localhost:5000/engines/bo/yolo (ok)
  > [engine] request.path : /engines/bo/yolo

  - http://localhost:5000/admin/tests (not ok)
  > [engine] request.path : //admin/tests


N.B : You can checkout 96088cc7fdabf43e2b2b813fd5c54916b10e6d55 (airbrake 9.5.0) to see all double slashes dissapear
