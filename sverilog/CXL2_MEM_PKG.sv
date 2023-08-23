// Copyright Sungkyunkwan University
// Author: Jungrae Kim <dale40@gmail.com>
// Description:

// Follows CXL specification, 2020 (Revision 2.0)

package CXL2_MEM_PKG;

    typedef struct {
        logic                           valid;
        logic   [3:0]                   mem_op_code;
        logic   [1:0]                   meta_field;
        logic   [1:0]                   meta_value;
        logic   [2:0]                   snp_type;
        logic   [51:5]                  address;        // TYPO of 51:6 ?
        logic   [15:0]                  tag;
        logic   [1:0]                   tc;
        logic   [3:0]                   ld_id;
        logic   [5:0]                   rsvd;
    } MEM_H2S_REQ;

    localparam  logic   [3:0]           H2S_REQ_OPCODE_MEM_INV              = 4'b0000,
                                        H2S_REQ_OPCODE_MEM_RD               = 4'b0001,
                                        H2S_REQ_OPCODE_MEM_RD_DATA          = 4'b0010,
                                        H2S_REQ_OPCODE_MEM_RD_FWD           = 4'b0011,
                                        H2S_REQ_OPCODE_MEM_WR_FWD           = 4'b0100,
                                        H2S_REQ_OPCODE_MEM_SPEC_RD          = 4'b1000,
                                        H2S_REQ_OPCODE_MEM_INV_NT           = 4'b1001;
    localparam  logic   [1:0]           H2S_REQ_METADATA_META_STATE         = 2'b00,
                                        H2S_REQ_METADATA_NO_OP              = 2'b11;
    localparam  logic   [1:0]           H2S_REQ_METASTATE_INVALID           = 2'b00,
                                        H2S_REQ_METASTATE_ANY               = 2'b10,
                                        H2S_REQ_METASTATE_SHARED            = 2'b11;
    localparam  logic   [2:0]           H2S_REQ_SNOOP_TYPE_NO_OP            = 3'b000,
                                        H2S_REQ_SNOOP_TYPE_SNP_DATA         = 3'b001,
                                        H2S_REQ_SNOOP_TYPE_SNP_CUR          = 3'b010,
                                        H2S_REQ_SNOOP_TYPE_SNP_INV          = 3'b011;

    typedef struct {
        logic                           valid;
        logic   [3:0]                   mem_op_code;
        logic   [1:0]                   meta_field;
        logic   [1:0]                   meta_value;
        logic   [2:0]                   snp_type;
        logic   [51:6]                  address;
        logic   [15:0]                  tag;
        logic   [1:0]                   tc;
        logic                           poison;
        logic   [3:0]                   ld_id;
        logic   [5:0]                   rsvd;
    } MEM_H2S_RWD;

    localparam  logic   [3:0]           H2S_RWD_OPCODE_MEM_WR               = 4'b0001,
                                        H2S_RWD_OPCODE_MEM_WR_PTL           = 4'b0010;
    typedef struct {
        logic                           valid;
        logic   [2:0]                   opcode;
        logic   [1:0]                   meta_field;
        logic   [1:0]                   meta_value;
        logic   [15:0]                  tag;
        logic   [3:0]                   ld_id;
        logic   [1:0]                   dev_load;
    } MEM_S2M_NDR;

    localparam  logic   [2:0]           S2M_NDR_OPCODE_CMP                  = 3'b000,
                                        S2M_NDR_OPCODE_CMP_S                = 3'b001,
                                        S2M_NDR_OPCODE_CMP_E                = 3'b010;
    localparam  logic   [1:0]           S2M_NDR_DEV_LOAD_LIGHT_LOAD         = 2'b00,
                                        S2M_NDR_DEV_LOAD_OPTIMAL_LOAD       = 2'b01,
                                        S2M_NDR_DEV_LOAD_MODERATE_OVERLOAD  = 2'b10,
                                        S2M_NDR_DEV_LOAD_SEVERE_OVERLOAD    = 2'b11;

    typedef struct {
        logic                           valid;
        logic   [2:0]                   opcode;
        logic   [1:0]                   meta_field;
        logic   [1:0]                   meta_value;
        logic   [15:0]                  tag;
        logic                           poison;
        logic   [3:0]                   ld_id;
        logic   [1:0]                   dev_load;
    } MEM_S2M_DRS;

    localparam  logic   [2:0]           S2M_DRS_OPCODE_MEM_DATA             = 3'b000;

endpackage
