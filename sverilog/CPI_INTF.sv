`define CPI_EPOCH_ID_WIDTH  10

interface CPI_GLOBAL (input clk, int rst_n);
    logic                               txcon_req;
    logic                               rxcon_ack;
    logic                               rxdiscon_nack;
    logic                               rx_empty;
    logic                               fatal;
    logic                               viral;
    logic   [`CPI_EPOCH_ID_WIDTH-1:0]   epoch_id;
    logic   [`CPI_EPOCH_ID_WIDTH-1:0]   epoch_commit;
    logic   [`CPI_EPOCH_ID_WIDTH-1:0]   epoch_reject;


    modport A2F (
        output          txcon_req, fatal, viral, epoch_id, epoch_commit, epoch_rejct,
        input           rxcon_ack, rxdiscon_nack, rx_empty
    );

    modport F2A (
        input           txcon_req, fatal, viral, epoch_id, epoch_commit, epoch_rejct,
        output          rxcon_ack, rxdiscon_nack, rx_empty
    );

    // synopsys translate_off
    task reset();

    endtask
    // synopsys translate_on
endinterface

interface CPI_F2A_GLOBAL (input clk, int rst_n);
    logic                               txcon_req;
    logic                               rxcon_ack;
    logic                               rxdiscon_nack;
    logic                               rx_empty;
    logic                               fatal;
    logic                               viral;

    modport AGENT (
        output          txcon_req, fatal, viral, epoch_id, epoch_commit, epoch_rejct,
        input           rxcon_ack, rxdiscon_nack, rx_empty
    );

    modport FABRIC (
        input           txcon_req, fatal, viral, epoch_id, epoch_commit, epoch_rejct,
        output          rxcon_ack, rxdiscon_nack, rx_empty
    );

    // synopsys translate_off
    task reset();

    endtask
    // synopsys translate_on
endinterface
