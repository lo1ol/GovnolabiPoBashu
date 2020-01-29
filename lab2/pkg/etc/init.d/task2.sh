#!/bin/sh
# chkconfig: - 98 02
# description: HTTP сервер на питоне с функцией загрузки файла в дирреткорию
# processname: SimpleHTTPServerWithUpload 

KIND="SimpleHTTPServerWithUpload"

PROG_PATH="/bin/HTTPServerPythonSource/SimpleHTTPServerWithUpload.py"
start() {
	echo "Starting $KIND services: "
	daemon -v python $PROG_PATH
	echo
}
stop() {
	echo "Shutting down $KIND services: "
	pid=`ps aux | grep "python $PROG_PATH" | grep -v -e "grep\|daemon" | awk '{print $2}'`
	
	if [ -z $pid ] 
	then
		echo "process doesn't start"
		return
	fi

	kill -9 $pid
	echo
}

restart() {
	echo "Restarting $KIND services: "
	stop
	start
	echo
}

case "$1" in
	start)
		start ;;
stop)
	stop ;;
restart)
	restart ;;
*)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
esac
exit $?
