// jtag_pll.v

// Generated using ACDS version 20.1 711

`timescale 1 ps / 1 ps
module jtag_pll (
		input  wire  clk_clk,             //           clk.clk
		output wire  pll_0_locked_export, //  pll_0_locked.export
		output wire  pll_0_outclk0_clk,   // pll_0_outclk0.clk
		input  wire  reset_reset_n        //         reset.reset_n
	);

	wire  [63:0] pll_0_reconfig_from_pll_reconfig_from_pll;                      // pll_0:reconfig_from_pll -> pll_reconfig_0:reconfig_from_pll
	wire  [63:0] pll_reconfig_0_reconfig_to_pll_reconfig_to_pll;                 // pll_reconfig_0:reconfig_to_pll -> pll_0:reconfig_to_pll
	wire  [31:0] master_0_master_readdata;                                       // mm_interconnect_0:master_0_master_readdata -> master_0:master_readdata
	wire         master_0_master_waitrequest;                                    // mm_interconnect_0:master_0_master_waitrequest -> master_0:master_waitrequest
	wire  [31:0] master_0_master_address;                                        // master_0:master_address -> mm_interconnect_0:master_0_master_address
	wire         master_0_master_read;                                           // master_0:master_read -> mm_interconnect_0:master_0_master_read
	wire   [3:0] master_0_master_byteenable;                                     // master_0:master_byteenable -> mm_interconnect_0:master_0_master_byteenable
	wire         master_0_master_readdatavalid;                                  // mm_interconnect_0:master_0_master_readdatavalid -> master_0:master_readdatavalid
	wire         master_0_master_write;                                          // master_0:master_write -> mm_interconnect_0:master_0_master_write
	wire  [31:0] master_0_master_writedata;                                      // master_0:master_writedata -> mm_interconnect_0:master_0_master_writedata
	wire  [31:0] mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_readdata;    // pll_reconfig_0:mgmt_readdata -> mm_interconnect_0:pll_reconfig_0_mgmt_avalon_slave_readdata
	wire         mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_waitrequest; // pll_reconfig_0:mgmt_waitrequest -> mm_interconnect_0:pll_reconfig_0_mgmt_avalon_slave_waitrequest
	wire   [5:0] mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_address;     // mm_interconnect_0:pll_reconfig_0_mgmt_avalon_slave_address -> pll_reconfig_0:mgmt_address
	wire         mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_read;        // mm_interconnect_0:pll_reconfig_0_mgmt_avalon_slave_read -> pll_reconfig_0:mgmt_read
	wire         mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_write;       // mm_interconnect_0:pll_reconfig_0_mgmt_avalon_slave_write -> pll_reconfig_0:mgmt_write
	wire  [31:0] mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_writedata;   // mm_interconnect_0:pll_reconfig_0_mgmt_avalon_slave_writedata -> pll_reconfig_0:mgmt_writedata
	wire         rst_controller_reset_out_reset;                                 // rst_controller:reset_out -> [mm_interconnect_0:master_0_clk_reset_reset_bridge_in_reset_reset, mm_interconnect_0:pll_reconfig_0_mgmt_reset_reset_bridge_in_reset_reset, pll_reconfig_0:mgmt_reset]

	jtag_pll_master_0 #(
		.USE_PLI     (0),
		.PLI_PORT    (50000),
		.FIFO_DEPTHS (2)
	) master_0 (
		.clk_clk              (clk_clk),                       //          clk.clk
		.clk_reset_reset      (~reset_reset_n),                //    clk_reset.reset
		.master_address       (master_0_master_address),       //       master.address
		.master_readdata      (master_0_master_readdata),      //             .readdata
		.master_read          (master_0_master_read),          //             .read
		.master_write         (master_0_master_write),         //             .write
		.master_writedata     (master_0_master_writedata),     //             .writedata
		.master_waitrequest   (master_0_master_waitrequest),   //             .waitrequest
		.master_readdatavalid (master_0_master_readdatavalid), //             .readdatavalid
		.master_byteenable    (master_0_master_byteenable),    //             .byteenable
		.master_reset_reset   ()                               // master_reset.reset
	);

	jtag_pll_pll_0 pll_0 (
		.refclk            (clk_clk),                                        //            refclk.clk
		.rst               (~reset_reset_n),                                 //             reset.reset
		.outclk_0          (pll_0_outclk0_clk),                              //           outclk0.clk
		.locked            (pll_0_locked_export),                            //            locked.export
		.reconfig_to_pll   (pll_reconfig_0_reconfig_to_pll_reconfig_to_pll), //   reconfig_to_pll.reconfig_to_pll
		.reconfig_from_pll (pll_0_reconfig_from_pll_reconfig_from_pll)       // reconfig_from_pll.reconfig_from_pll
	);

	altera_pll_reconfig_top #(
		.device_family       ("Cyclone V"),
		.ENABLE_MIF          (0),
		.MIF_FILE_NAME       (""),
		.ENABLE_BYTEENABLE   (0),
		.BYTEENABLE_WIDTH    (4),
		.RECONFIG_ADDR_WIDTH (6),
		.RECONFIG_DATA_WIDTH (32),
		.reconf_width        (64),
		.WAIT_FOR_LOCK       (1)
	) pll_reconfig_0 (
		.mgmt_clk          (clk_clk),                                                        //          mgmt_clk.clk
		.mgmt_reset        (rst_controller_reset_out_reset),                                 //        mgmt_reset.reset
		.mgmt_waitrequest  (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_waitrequest), // mgmt_avalon_slave.waitrequest
		.mgmt_read         (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_read),        //                  .read
		.mgmt_write        (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_write),       //                  .write
		.mgmt_readdata     (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_readdata),    //                  .readdata
		.mgmt_address      (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_address),     //                  .address
		.mgmt_writedata    (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_writedata),   //                  .writedata
		.reconfig_to_pll   (pll_reconfig_0_reconfig_to_pll_reconfig_to_pll),                 //   reconfig_to_pll.reconfig_to_pll
		.reconfig_from_pll (pll_0_reconfig_from_pll_reconfig_from_pll),                      // reconfig_from_pll.reconfig_from_pll
		.mgmt_byteenable   (4'b0000)                                                         //       (terminated)
	);

	jtag_pll_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                         (clk_clk),                                                        //                                       clk_0_clk.clk
		.master_0_clk_reset_reset_bridge_in_reset_reset        (rst_controller_reset_out_reset),                                 //        master_0_clk_reset_reset_bridge_in_reset.reset
		.pll_reconfig_0_mgmt_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                                 // pll_reconfig_0_mgmt_reset_reset_bridge_in_reset.reset
		.master_0_master_address                               (master_0_master_address),                                        //                                 master_0_master.address
		.master_0_master_waitrequest                           (master_0_master_waitrequest),                                    //                                                .waitrequest
		.master_0_master_byteenable                            (master_0_master_byteenable),                                     //                                                .byteenable
		.master_0_master_read                                  (master_0_master_read),                                           //                                                .read
		.master_0_master_readdata                              (master_0_master_readdata),                                       //                                                .readdata
		.master_0_master_readdatavalid                         (master_0_master_readdatavalid),                                  //                                                .readdatavalid
		.master_0_master_write                                 (master_0_master_write),                                          //                                                .write
		.master_0_master_writedata                             (master_0_master_writedata),                                      //                                                .writedata
		.pll_reconfig_0_mgmt_avalon_slave_address              (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_address),     //                pll_reconfig_0_mgmt_avalon_slave.address
		.pll_reconfig_0_mgmt_avalon_slave_write                (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_write),       //                                                .write
		.pll_reconfig_0_mgmt_avalon_slave_read                 (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_read),        //                                                .read
		.pll_reconfig_0_mgmt_avalon_slave_readdata             (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_readdata),    //                                                .readdata
		.pll_reconfig_0_mgmt_avalon_slave_writedata            (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_writedata),   //                                                .writedata
		.pll_reconfig_0_mgmt_avalon_slave_waitrequest          (mm_interconnect_0_pll_reconfig_0_mgmt_avalon_slave_waitrequest)  //                                                .waitrequest
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
