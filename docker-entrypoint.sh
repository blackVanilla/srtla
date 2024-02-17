#!/bin/bash

# Запускаем команды srt и srtla в фоновом режиме
/opt/srtla/srtla_rec 5000 127.0.0.1 5002 &
/opt/srt/srt-live-transmit -st:yes "srt://127.0.0.1:5002?mode=listener&lossmaxttl=40&latency=100" "srt://0.0.0.0:5001?mode=listener" &

# Получаем PID процессов
srt_pid=$!
srtla_pid=$!

# Ждем завершения любого из процессов
wait -n

# Завершаем скрипт с нулевым статусом, если все процессы завершились успешно
exit -1