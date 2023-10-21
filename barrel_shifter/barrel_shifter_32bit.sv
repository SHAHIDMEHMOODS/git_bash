
module barrel_shifter_32bit(
    input logic [31:0] data,
    input logic [4:0] amt,
    output logic [31:0] out
);

    always_comb begin
        case (amt)
            5'b00000: out = data;
            5'b00001: out = {data[0], data[31:1]};
            5'b00010: out = {data[1:0], data[31:2]};
            5'b00011: out = {data[2:0], data[31:3]};
            5'b00100: out = {data[3:0], data[31:4]};
            5'b00101: out = {data[4:0], data[31:5]};
            5'b00110: out = {data[5:0], data[31:6]};
            5'b00111: out = {data[6:0], data[31:7]};
            5'b01000: out = {data[7:0], data[31:8]};
            5'b01001: out = {data[8:0], data[31:9]};
            5'b01010: out = {data[9:0], data[31:10]};
            5'b01011: out = {data[10:0], data[31:11]};
            5'b01100: out = {data[11:0], data[31:12]};
            5'b01101: out = {data[12:0], data[31:13]};
            5'b01110: out = {data[13:0], data[31:14]};
            5'b01111: out = {data[14:0], data[31:15]};
            5'b10000: out = {data[15:0], data[31:16]};
            5'b10001: out = {data[16:0], data[31:17]};
            5'b10010: out = {data[17:0], data[31:18]};
            5'b10011: out = {data[18:0], data[31:19]};
            5'b10100: out = {data[19:0], data[31:20]};
            5'b10101: out = {data[20:0], data[31:21]};
            5'b10110: out = {data[21:0], data[31:22]};
            5'b10111: out = {data[22:0], data[31:23]};
            5'b11000: out = {data[23:0], data[31:24]};
            5'b11001: out = {data[24:0], data[31:25]};
            5'b11010: out = {data[25:0], data[31:26]};
            5'b11011: out = {data[26:0], data[31:27]};
            5'b11100: out = {data[27:0], data[31:28]};
            5'b11101: out = {data[28:0], data[31:29]};
            5'b11110: out = {data[29:0], data[31:30]};
            default: out = {data[30:0], data[31]};
        endcase
    end
endmodule
