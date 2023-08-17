package AXI4_PKG;
    localparam  logic   [2:0]       AXI4_SIZE_1B    = 3'b000,
                                    AXI4_SIZE_2B    = 3'b001,
                                    AXI4_SIZE_4B    = 3'b010,
                                    AXI4_SIZE_8B    = 3'b011,
                                    AXI4_SIZE_16B   = 3'b100,
                                    AXI4_SIZE_32B   = 3'b101,
                                    AXI4_SIZE_64B   = 3'b110,
                                    AXI4_SIZE_128B  = 3'b111;

    localparam  logic   [1:0]       AXI4_BURST_FIXED= 2'b00,
                                    AXI4_BURST_INCR = 2'b01,
                                    AXI4_BURST_WRAP = 2'b10,
                                    AXI4_BURST_RSVD = 2'b11;

    localparam  logic               AXI4_LOCK_NORMAL= 1'b0,
                                    AXI4_LOCK_RSVD  = 1'b1;

    localparam  logic   [1:0]       AXI4_RESP_OKAY  = 2'b00,
                                    AXI4_RESP_EXOKAY= 2'b01,
                                    AXI4_RESP_SLVERR= 2'b10,
                                    AXI4_RESP_DECERR= 2'b11;

endpackage
