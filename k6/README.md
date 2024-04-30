# Stress test

## What is it ?

There are two tests :

- There is a breakpoint test, that simulate long time connection with users, and try to determine which thresold cannot be served by our server.
- There is a stress test, that simulate a tiny spike of connections.
- There is a load test script, for 404 status on https endpoint.

## Ignore

## How to use it ?

To launch it, use :

```Bash
docker run --rm -i grafana/k6 run - <script.js
```

Aviable scripts :

- stress.js
- breakpoint.js
- load_with_404.js
