get_cpu_usage() {
    echo "CPU Usage:"
    top -bn1 | grep '%Cpu' | awk '{print "  CPU: " $2 "% user, " $4 "% system"}'

}

get_ram_usage() {
    echo "RAM Usage:"
    free -h | awk '/^Mem:/ {print "  Total: " $2, ", Used: " $3, ", Free: " $4}'
}

get_report() {
    echo "System Report:"
    get_cpu_usage
    get_ram_usage
}

get_report