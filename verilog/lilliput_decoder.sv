// lilliput_decoder.sv
// Sparse LUT ("LILLIPUT") decoder: syndrome -> predicted observable bit
//
// Uses two memories loaded with $readmemh (syndromes) and $readmemb (bits).
// Intended for simulation / FPGA prototyping.

module lilliput_decoder #(
    parameter int N_DET = 40,
    parameter int N_LUT = 10701,
    parameter string LUT_SYND_FILE = "lut_synd.mem",
    parameter string LUT_OUT_FILE  = "lut_out.mem"
) (
    input  logic [N_DET-1:0] syndrome,
    output logic             pred_obs
);

    // LUT memories
    logic [N_DET-1:0] lut_synd [0:N_LUT-1];
    logic             lut_out  [0:N_LUT-1];

    initial begin
        // syndrome patterns are hex strings (one per line)
        $readmemh(LUT_SYND_FILE, lut_synd);

        // outputs are "0"/"1" lines; read as binary
        $readmemb(LUT_OUT_FILE, lut_out);
    end

    // Combinational lookup: default 0 if missing
    always_comb begin
        pred_obs = 1'b0;
        for (int i = 0; i < N_LUT; i++) begin
            if (syndrome == lut_synd[i]) begin
                pred_obs = lut_out[i];
            end
        end
    end


endmodule
