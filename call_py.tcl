
# call py proc
proc call_python {n} {
    #set output [exec python hello.py {*}$argv]
    #set output [exec python hello.py 5]
    set result [exec python -c "import hello; print(hello.say_hello($n))"]
    puts "Raw result $result"
    set result [process_pylist $result]
    return $result
}

# process py list returned as a string
proc process_pylist {str} {
    set tmp_list {}
    set s1 [string trim $str "\]\[" ]
    set lines [split $s1 ","]
    foreach item $lines {
	set item [string trim $item ]
	set item [string trim $item "\'"]
	lappend tmp_list $item
    }
    return $tmp_list
}

puts "tcl main: calling call_python"
set my_data [call_python 20]

puts "Outside!"
puts $my_data

set m 0
foreach i $my_data {
    incr m
    puts "member $m is >$i<"
}
puts "done"
