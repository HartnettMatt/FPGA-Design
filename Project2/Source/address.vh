parameter i2c_data_1 = 24'h341e00; //starting point rst register
parameter i2c_data_2 = {8'h34, 7'b000_0111, 9'b0_0001_0011}; //dac information
parameter i2c_data_3 = {8'h34, 7'b000_0010, 9'b1_0111_1001}; //left headphone
parameter i2c_data_4 = {8'h34, 7'b000_0110, 9'b0_0000_0111};//power down control
parameter i2c_data_5 = {8'h34, 7'b000_1000, 9'b0_0000_0001}; //sampling
parameter i2c_data_6 = {8'h34, 7'b000_1001, 9'b1_1111_1111};//active
parameter i2c_data_7 = {8'h34, 7'b000_1000, 9'b0_0001_0010};//anal. auid. path
