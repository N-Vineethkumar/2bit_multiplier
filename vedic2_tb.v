// Testbench for 2x2 Vedic Multiplier
module vedic2_tb;
    // Declare testbench variables
    reg [1:0] a, b;
    wire [3:0] s;
    integer i, j;

    // Instantiate the vedic2 module
    vedic2 uut(
        .a(a),
        .b(b),
        .s(s)
    );

    // Initial stimulus
    initial begin
        // Initialize inputs
        a = 0;
        b = 0;
        
        // Display header
        $display("Time\tA\tB\tResult\tExpected");
        $display("------------------------------------");
        
        // Test all possible combinations (4x4 = 16 combinations)
        for(i = 0; i < 4; i = i + 1) begin
            for(j = 0; j < 4; j = j + 1) begin
                a = i;
                b = j;
                #10; // Wait 10 time units
                $display("%0d\t%b\t%b\t%b\t%d", $time, a, b, s, a*b);
                
                // Verify result
                if (s !== a*b) begin
                    $display("ERROR at time %0d: %d x %d = %d (got %d)", 
                            $time, a, b, a*b, s);
                end
            end
        end
        
        // Additional specific test cases
        #10 a = 2'b11; b = 2'b11; // Maximum value test
        #10 a = 2'b00; b = 2'b11; // Zero multiplication
        #10 a = 2'b10; b = 2'b01; // Random test
        
        #10 $finish;
    end

    // Monitor changes
    always @(a or b) begin
        #1; // Small delay for multiplication to complete
        if (s !== a*b) begin
            $display("ERROR: %b x %b = %d (got %b)", a, b, a*b, s);
        end
    end

endmodule
