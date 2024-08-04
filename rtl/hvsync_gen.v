module hvsync_gen
#(parameter HS_POS=9, VS_POS=14, HS_LEN=28)
(
	input  clk,
	input  ce_pix,

	input  hblank,
	input  vblank,

	input [3:0] hs_offset,
	input [3:0] vs_offset,

	output hsync_o,
	output vsync_o
);

// This is not suitable for interlaced video

reg hsync, vsync;
reg [7:0] hb_cnt, vb_cnt;
always @(posedge clk) begin
	if (~hblank) begin
		hb_cnt <= 0;
	end else if (ce_pix) begin
		hb_cnt <= hb_cnt + 1'b1;
		if (hb_cnt == (HS_POS + $signed(hs_offset))) begin
			hsync <= 1;
			if (vb_cnt == (VS_POS        + $signed(vs_offset))) vsync <= 1;
			if (vb_cnt == (VS_POS + 8'd3 + $signed(vs_offset))) vsync <= 0;
		end

		if (hb_cnt == (HS_POS + HS_LEN + $signed(hs_offset))) begin
			hsync <= 0;
			if (vblank) begin
				vb_cnt <= vb_cnt + 1'b1;
			end
		end
	end

	if (~vblank) begin
		vb_cnt <= 0;
	end
end

assign hsync_o = hsync;
assign vsync_o = vsync;

endmodule