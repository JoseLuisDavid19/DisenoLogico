 
`define FINAL_STATE   3'd6
`define INVALID_STATE 3'dx

module LCM(
    input clk,
    input rst,
    input [31:0] n1,
    input [31:0] n2,
    output [31:0] result
);

    reg [31:0] minMultiple;
    reg [31:0] minMultipleP;
    reg [2:0] cs /*verilator public*/;
    reg [2:0] ns /*verilator public*/;

    assign result = minMultiple;

    always @ (*) begin
        case (cs)
            'd0: 
                if(n1>n2)
                 ns='d1;
                else
                ns='d2;
                /* TODO: Implement state 0 logic */
            'd1: ns='d3;
                /* TODO: Implement state 1 logic */
            'd2:ns='d3;
                /* TODO: Implement state 2 logic */
            'd3:if((minMultiple % n1)==0 )
                    ns='d4;
                else 
                    ns='d5;
                /* TODO: Implement state 3 logic */
            'd4:if((minMultiple % n2)==0 )
                    ns=`FINAL_STATE;
                else 
                    ns='d5;
                /* TODO: Implement state 4 logic */
            'd5:ns='d3;
                /* TODO: Implement state 5 logic */
            `FINAL_STATE: ns = `FINAL_STATE;
            default: ns = `INVALID_STATE;
        endcase;
    end

    always @ (*) begin
        case (cs)
            'd0: minMultipleP = minMultiple;
            'd1: minMultipleP = n1;
            'd2: minMultipleP = n2;

            'd3: minMultipleP = minMultiple;
            'd4: minMultipleP = minMultiple;
            'd5:
                minMultipleP = minMultiple + 1;
            `FINAL_STATE:
                minMultipleP = minMultiple;
            default:
                minMultipleP = 32'dx;
        endcase
    end

    always @ (posedge clk) begin
        if (rst)
            cs <= 'd0;
        else
            cs <= ns; 
    end

    always @ (posedge clk) begin
        minMultiple <= minMultipleP;
    end
endmodule
