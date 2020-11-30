load_package report
project_open [get_current_project]
load_report
set panel_name "Fitter||Fitter Summary"
set csv_file "fitter_summary.csv"
set fh [open $csv_file w]
set num_rows [get_number_of_rows -name $panel_name]

for { set i 0 } {$i < $num_rows} {incr i } {
  set data1 [get_report_panel_data -name $panel_name -row $i -col 0 ]
  set data2 [get_report_panel_data -name $panel_name -row $i -col 1 ]
  set data3 \"$data2\"
  puts $fh [join [list $data1 $data3] "," ]
}

close $fh
unload_report
