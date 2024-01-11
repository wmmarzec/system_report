get_cpu_info() {
    echo "CPU Usage:"
    top -bn1 | grep '%Cpu' | awk '{print "  CPU: " $2 "% user, " $4 "% system"}'

}

get_ram_info() {
    echo "RAM Usage:"
    free -h | awk '/^Mem:/ {print "  Total: " $2, ", Used: " $3, ", Free: " $4}'
}

get_report() {
    echo "System Report:"
    get_cpu_info
    get_ram_info
}

get_report