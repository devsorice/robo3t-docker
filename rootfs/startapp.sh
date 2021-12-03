#!/bin/sh
exec /usr/bin/xterm
# #!/usr/bin/with-contenv sh
# set -u # Treat unset variables as an error.

# trap "exit" TERM QUIT INT
# trap "kill_jd" EXIT

# log() {
#     echo "[robo3t_supervisor] $*"
# }

# getpid_jd() {
#     PID=UNSET
#     if [ -f $(pidof Xvfb) ]; then
#         PID=$(pidof Xvfb)
#     fi
#     echo "${PID:-UNSET}"
# }

# is_jd_running() {
#     [ "$(getpid_jd)" != "UNSET" ]
# }

# start_jd() {
#     Xvfb :1 && robo3t > /config/logs/output.log 2>&1
# }

# kill_jd() {
#     PID="$(getpid_jd)"
#     if [ "$PID" != "UNSET" ]; then
#         log "Terminating robo3t..."
#         kill $PID
#         wait $PID
#     fi
# }

# if ! is_jd_running; then
#     log "robo3t not started yet.  Proceeding..."
#     start_jd
# fi

# JD_NOT_RUNNING=0
# while [ "$JD_NOT_RUNNING" -lt 5 ]
# do
#     if is_jd_running; then
#         JD_NOT_RUNNING=0
#     else
#         JD_NOT_RUNNING="$(expr $JD_NOT_RUNNING + 1)"
#     fi
#     sleep 1
# done

# log "JDownloader2 no longer running.  Exiting..."