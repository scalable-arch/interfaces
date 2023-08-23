// Copyright Sungkyunkwan University
// Author: Jungrae Kim <dale40@gmail.com>
// Description:

// Follows CXL specification, 2020 (Revision 2.0)

package CXL2_CACHE_PKG;
    localparam  logic   [4:0]           D2H_REQ_OPCODE_RD_CURR              = 5'b00001,
                                        D2H_REQ_OPCODE_RD_OWN               = 5'b00010,
                                        D2H_REQ_OPCODE_RD_SHARED            = 5'b00011,
                                        D2H_REQ_OPCODE_RD_ANY               = 5'b00100,
                                        D2H_REQ_OPCODE_RD_OWN_NODATA        = 5'b00101,
                                        D2H_REQ_OPCODE_ITOMWR               = 5'b00110,
                                        D2H_REQ_OPCODE_MEM_WR               = 5'b00111,
                                        D2H_REQ_OPCODE_CL_FLUSH             = 5'b01000,
                                        D2H_REQ_OPCODE_CLEAN_EVICT          = 5'b01001,
                                        D2H_REQ_OPCODE_DIRTY_EVICT          = 5'b01010,
                                        D2H_REQ_OPCODE_CLEAN_EVICT_NO_DATA  = 5'b01011,
                                        D2H_REQ_OPCODE_WOWR_INV             = 5'b01100,
                                        D2H_REQ_OPCODE_WOWR_INVF            = 5'b01101,
                                        D2H_REQ_OPCODE_WR_INV               = 5'b01110,
                                        D2H_REQ_OPCODE_CACHE_FLUSHED        = 5'b10000;

    localparam  logic   [4:0]           D2H_RSP_OPCODE_RSP_IHITI            = 5'b00100,
                                        D2H_RSP_OPCODE_RSP_VHITV            = 5'b00110,
                                        D2H_RSP_OPCODE_RSP_IHTISE           = 5'b00101,
                                        D2H_RSP_OPCODE_RSP_SHTISE           = 5'b00001,
                                        D2H_RSP_OPCODE_RSP_SFWDM            = 5'b00111,
                                        D2H_RSP_OPCODE_RSP_IFWDM            = 5'b01111,
                                        D2H_RSP_OPCODE_RSP_VFWDV            = 5'b10110;

    localparam  logic   [1:0]           H2D_REQ_OPCODE_SNP_DATA             = 3'b001,
                                        H2D_REQ_OPCODE_SNP_INV              = 3'b010,
                                        H2D_REQ_OPCODE_SNP_CURR             = 3'b011;

    localparam  logic   [3:0]           H2D_RSP_OPCODE_WRITE_PULL           = 4'b0001,
                                        H2D_RSP_OPCODE_GO                   = 4'b0100,
                                        H2D_RSP_OPCODE_GO_WRITE_PULL        = 4'b0101,
                                        H2D_RSP_OPCODE_EXT_CMP              = 4'b0110,
                                        H2D_RSP_OPCODE_GO_WRITE_PULL_DROP   = 4'b1000,
                                        H2D_RSP_OPCODE_FAST_GO              = 4'b1100,
                                        H2D_RSP_OPCODE_FAST_GO_WRITE_PULL   = 4'b1101,
                                        H2D_RSP_OPCODE_GO_ERR_WRITE_PULL    = 4'b1111;
    typedef struct {
        logic                           valid;
        logic   [4:0]                   opcode;
        logic   [51:6]                  address;
        logic   [11:0]                  cqid;
        logic                           nt;
        logic   [13:0]                  rsvd;
    } D2H_REQ;

    localparam  logic                   NT_DEFAULT      = 1'b0,
                                        NT_LRU          = 1'b1;
    
    typedef struct {
        logic                           valid;
        logic   [4:0]                   opcode;
        logic   [11:0]                  uqid;
        logic   [1:0]                   rsvd;
    } D2H_RSP;
    
    typedef struct {
        logic                           valid;
        logic   [11:0]                  uqid;
        logic                           chunk_valid;
        logic                           bogus;
        logic                           poison;
        logic                           rsvd;
    } D2H_DATA_HDR;
    
    typedef struct {
        logic                           valid;
        logic   [2:0]                   opcode;
        logic   [51:6]                  address;
        logic   [11:0]                  uqid;
        logic   [1:0]                   rsvd;
    } H2D_REQ;
    
    typedef struct {
        logic                           valid;
        logic   [3:0]                   opcode;
        logic   [11:0]                  rsp_data;
        logic   [1:0]                   rsp_pre;
        logic   [11:0]                  cqid;
        logic                           rsvd;
    } H2D_RSP;

    typedef struct {
        logic                           valid;
        logic   [11:0]                  cqid;
        logic                           chunk_valid;
        logic                           poison;
        logic                           go_err;
        logic   [7:0]                   rsvd;
    } H2D_DATA_HDR;

endpackage

package CXL2_CACHE_PKG;

    typedef struct {
        logic                           valid;
        logic   [3:0]                   mem_op_code;
        logic   [1:0]                   meta_field;
        logic   [1:0]                   meta_value;
        logic   [2:0]                   snp_type;
        logic   [51:5]                  address;
        logic   [15:0]                  tag;
        logic   [1:0]                   tc;
        logic   [3:0]                   ld_id;
        logic   [5:0]                   rsvd;
    } MEM_H2D_REQ;

    localparam  logic   [3:0]           H2D_REQ_OPCODE_MEM_INV              = 4'b0000,
                                        H2D_REQ_OPCODE_MEM_RD               = 4'b0001,
                                        H2D_REQ_OPCODE_MEM_RD_DATA          = 4'b0010,
                                        H2D_REQ_OPCODE_MEM_RD_FWD           = 4'b0011,
                                        H2D_REQ_OPCODE_MEM_WR_FWD           = 4'b0100,
                                        H2D_REQ_OPCODE_MEM_SPEC_RD          = 4'b1000,
                                        H2D_REQ_OPCODE_MEM_INV_NT           = 4'b1001;
    localparam  logic   [1:0]           H2D_REQ_METADATA_META_STATE         = 2'b00,
                                        H2D_REQ_METADATA_NO_OP              = 2'b11;
    localparam  logic   [1:0]           H2D_REQ_METASTATE_INVALID           = 2'b00,
                                        H2D_REQ_METASTATE_ANY               = 2'b10,
                                        H2D_REQ_METASTATE_SHARED            = 2'b11;
    localparam  logic   [2:0]           H2D_REQ_SNOOP_TYPE_NO_OP            = 3'b000,
                                        H2D_REQ_SNOOP_TYPE_SNP_DATA         = 3'b001,
                                        H2D_REQ_SNOOP_TYPE_SNP_CUR          = 3'b010,
                                        H2D_REQ_SNOOP_TYPE_SNP_INV          = 3'b011;

endpackage
