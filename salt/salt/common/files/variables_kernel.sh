mem_bytes=$(awk '/MemTotal:/ { printf "%0.f",$2 * 1024}' /proc/meminfo)
shmmax=$(echo "$mem_bytes * 0.90" | bc | cut -f 1 -d '.') 
shmall=$(expr $mem_bytes / $(getconf PAGE_SIZE))
max_orphan=$(echo "$mem_bytes * 0.10 / 65536" | /usr/bin/bc | awk '{print int( $1 )}')
file_max=$(echo "$mem_bytes / 4194304 * 256" | /usr/bin/bc | awk '{print int( $1 )}')
max_tw=$(($file_max*2))
min_free=$(echo "($mem_bytes / 1024) * 0.01" | /usr/bin/bc | awk '{print int( $1 )}')

case "$1" in
    shmmax)
        expr $shmmax
        ;;
    shmall)
        echo $shmall
        ;;
    max_orphan)
        echo $max_orphan
        ;;
    file_max)
        echo $file_max
        ;;
    max_tw)
        echo $max_tw
        ;;
    min_free)
        echo $min_free
        ;;
    *)
        echo 0
esac
