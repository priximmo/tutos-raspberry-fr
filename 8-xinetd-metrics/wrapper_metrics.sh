#!/bin/bash
# small http wrapper for bash scripts via xinetd

ulimit -n 20480
ulimit -l 512

root='/opt/scripts/'
file="$1"
mime='text/plain'

cd $root

if [ -f "$root$file" ]; then
  $root$file > /tmp/.$$.output

  size=$(stat -c "%s" "/tmp/.$$.output")

  printf 'HTTP/1.1 200 OK\r\nDate: %s\r\nContent-Length: %s\r\nContent-Type: %s\r\nConnection: close\r\n\r\n' "$(date)" "$size" "$mime"

  cat /tmp/.$$.output

  sleep 1
  rm -f /tmp/.$$.output
  exit 0
fi

exit 1

root@pi1:/opt/scripts# cat temperature.sh 
#!/bin/bash
# printMetric name description type value
printMetric() {
    echo "# HELP $1 $2"
    echo "# TYPE $1 $3"
    echo "$1 $4"
}

