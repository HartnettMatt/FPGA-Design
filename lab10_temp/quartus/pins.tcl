# Only want to run this after fitter, and if pins are missing location assignments,
# stop the compilation

# This code only allows script to run after fitter
set module [lindex $quartus(args) 0]
set project_name [lindex $quartus(args) 1]
if [string match "quartus_fit" $module] {

load_package report
load_package project
# Check to see how to find if current project is open
if {![is_project_open]} {
    project_open $project_name
} 
load_report
# Set various things
set panel_name1 "Fitter||Resource Section||Input Pins"
set panel_name2 "Fitter||Resource Section||Output Pins"
set id1 [get_report_panel_id $panel_name1]
set id2 [get_report_panel_id $panel_name2]
set column_name {Location assigned by}
set num_rows1 [get_number_of_rows -name $panel_name1]
set num_rows2 [get_number_of_rows -name $panel_name2]

set in_error 0
set out_error 0

# Go through all the rows in the Input pins file
for { set i 1 } { $i < $num_rows1 } { incr i } {
    set info [string match [get_report_panel_data -col_name $column_name -row $i -id $id1] "User"]
    if {$info == 0} {
        set in_error [expr $in_error+1]
    }
}

# Go through all the rows in the Output pins file
for { set i 1 } { $i < $num_rows2 } { incr i } {
    set info [string match [get_report_panel_data -col_name $column_name -row $i -id $id2] "User"]
    if {$info == 0} {
        set out_error [expr $out_error+1]
    }
}

if {$in_error != 0} {
    post_message -type error "$in_error missing input pin assignment(s)"
}   else {
    post_message "All [expr $num_rows1-1] input pins have been assigned locations."
}
if {$out_error != 0} {
    post_message -type error "$out_error missing output pin assignment(s)"
}   else {
    post_message "All [expr $num_rows2-1] output pins have been assigned locations."
}

puts "Number of input pins = [expr $num_rows1-1]"
puts "Number of unassigned input pins = $in_error"
puts "Number of output pins = [expr $num_rows2-1]"
puts "Number of unassigned output pins = $out_error"

unload_report

# If errors occurred, close project
set error [expr $in_error + $out_error]
if {$error != 0} {
    project_close
}

}   else {
        puts "Continue.."
}