package AXI3_PKG;
    localparam  logic   [2:0]       AXI3_SIZE_1B    = 3'b000,
                                    AXI3_SIZE_2B    = 3'b001,
                                    AXI3_SIZE_4B    = 3'b010,
                                    AXI3_SIZE_8B    = 3'b011,
                                    AXI3_SIZE_16B   = 3'b100,
                                    AXI3_SIZE_32B   = 3'b101,
                                    AXI3_SIZE_64B   = 3'b110,
                                    AXI3_SIZE_128B  = 3'b111;

    localparam  logic   [1:0]       AXI3_BURST_FIXED= 2'b00,
                                    AXI3_BURST_INCR = 2'b01,
                                    AXI3_BURST_WRAP = 2'b10,
                                    AXI3_BURST_RSVD = 2'b11;

    localparam  logic   [1:0]       AXI3_LOCK_NORMAL= 2'b00,
                                    AXI3_LOCK_EXCLUSIVE = 2'b01,
                                    AXI3_LOCK_LOCKED= 2'b10,
                                    AXI3_LOCK_RSVD  = 2'b11;

    localparam  logic   [1:0]       AXI3_RESP_OKAY  = 2'b00,
                                    AXI3_RESP_EXOKAY= 2'b01,
                                    AXI3_RESP_SLVERR= 2'b10,
                                    AXI3_RESP_DECERR= 2'b11;

endpackage
