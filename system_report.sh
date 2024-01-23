get_cpu_usage() {
    top -b -n 1 > cpu.txt
    echo "CPU Usage:"
    grep "%Cpu(s)" cpu.txt | awk '{print "  Usage by user: " $2 "%"}'
    grep "%Cpu(s)" cpu.txt | awk '{print "  Usage by system: " $4 "%"}'

}

get_ram_usage() {
    echo "RAM Usage:"
    free -h > ram.txt
    grep "Mem" ram.txt | awk '/^Mem:/ {print "  Total: " $2}'
    grep "Mem" ram.txt | awk '/^Mem:/ {print "  Used: " $3}'
    grep "Mem" ram.txt | awk '/^Mem:/ {print "  Free: " $4}'
}

get_report() {
    echo "System Report:"
    get_cpu_usage
    get_ram_usage
}

get_report

rm cpu.txt
rm ram.txt

