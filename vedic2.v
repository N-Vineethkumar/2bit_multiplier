module vedic2(
input [1:0]a,b, output [3:0]s
);
    wire c1,c2,c3,c4;
    assign s[0] = a[0]&b[0];
    assign c1=b[0]&a[1];
    assign c2=b[1]&a[0];
    ha ha1(c1,c2,s[1],c3);
    assign c4 = a[1]&b[1];
    ha ha2(c3,c4,s[2],s[3]);
endmodule

module ha(
input a,b, output s,c
);
assign s = a^b;
assign c = a&b;
endmodule
