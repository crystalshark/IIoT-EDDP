// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.1
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Clarke_Inverse,hls_ip_2017_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.194667,HLS_SYN_LAT=4,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=1,HLS_SYN_FF=354,HLS_SYN_LUT=264}" *)

module Clarke_Inverse (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        s_axis_V_TDATA,
        s_axis_V_TVALID,
        s_axis_V_TREADY,
        m_axis_V_TDATA,
        m_axis_V_TVALID,
        m_axis_V_TREADY
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] s_axis_V_TDATA;
input   s_axis_V_TVALID;
output   s_axis_V_TREADY;
output  [63:0] m_axis_V_TDATA;
output   m_axis_V_TVALID;
input   m_axis_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [63:0] s_axis_V_0_data_out;
wire    s_axis_V_0_vld_in;
wire    s_axis_V_0_vld_out;
wire    s_axis_V_0_ack_in;
reg    s_axis_V_0_ack_out;
reg   [63:0] s_axis_V_0_payload_A;
reg   [63:0] s_axis_V_0_payload_B;
reg    s_axis_V_0_sel_rd;
reg    s_axis_V_0_sel_wr;
wire    s_axis_V_0_sel;
wire    s_axis_V_0_load_A;
wire    s_axis_V_0_load_B;
reg   [1:0] s_axis_V_0_state;
wire    s_axis_V_0_state_cmp_full;
reg   [63:0] m_axis_V_1_data_out;
reg    m_axis_V_1_vld_in;
wire    m_axis_V_1_vld_out;
wire    m_axis_V_1_ack_in;
wire    m_axis_V_1_ack_out;
reg   [63:0] m_axis_V_1_payload_A;
reg   [63:0] m_axis_V_1_payload_B;
reg    m_axis_V_1_sel_rd;
reg    m_axis_V_1_sel_wr;
wire    m_axis_V_1_sel;
wire    m_axis_V_1_load_A;
wire    m_axis_V_1_load_B;
reg   [1:0] m_axis_V_1_state;
wire    m_axis_V_1_state_cmp_full;
reg    s_axis_V_TDATA_blk_n;
wire    ap_CS_fsm_state2;
reg    m_axis_V_TDATA_blk_n;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire   [15:0] Valpha_fu_73_p1;
reg   [15:0] Valpha_reg_252;
reg   [15:0] Theta_reg_258;
reg   [16:0] tmp_5_reg_263;
reg   [16:0] tmp_1_reg_268;
wire    ap_CS_fsm_state3;
reg   [16:0] tmp_4_reg_273;
wire   [0:0] icmp_fu_164_p2;
reg   [0:0] icmp_reg_278;
wire   [0:0] icmp3_fu_180_p2;
reg   [0:0] icmp3_reg_283;
wire   [63:0] res_fu_234_p5;
wire  signed [15:0] Vbeta_fu_77_p4;
wire  signed [31:0] s3vb_fu_245_p2;
wire  signed [17:0] tmp_4_cast_fu_110_p1;
wire  signed [17:0] tmp_5_cast_fu_113_p1;
wire   [17:0] tmp_6_fu_116_p2;
wire   [17:0] sum_fu_132_p2;
wire   [17:0] tmp_8_fu_138_p2;
wire   [1:0] tmp_fu_154_p4;
wire   [1:0] tmp_2_fu_170_p4;
wire   [16:0] Vb_fu_186_p3;
wire   [16:0] Vc_fu_198_p3;
wire   [0:0] tmp_7_fu_192_p2;
wire   [15:0] tmp_9_fu_210_p1;
wire   [0:0] tmp_s_fu_204_p2;
wire   [15:0] tmp_11_fu_222_p1;
wire   [15:0] tmp_12_fu_226_p3;
wire   [15:0] tmp_10_fu_214_p3;
wire   [16:0] s3vb_fu_245_p0;
reg   [4:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 s_axis_V_0_sel_rd = 1'b0;
#0 s_axis_V_0_sel_wr = 1'b0;
#0 s_axis_V_0_state = 2'd0;
#0 m_axis_V_1_sel_rd = 1'b0;
#0 m_axis_V_1_sel_wr = 1'b0;
#0 m_axis_V_1_state = 2'd0;
end

Clarke_Inverse_mubkb #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 17 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
Clarke_Inverse_mubkb_U0(
    .din0(s3vb_fu_245_p0),
    .din1(Vbeta_fu_77_p4),
    .dout(s3vb_fu_245_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        m_axis_V_1_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == m_axis_V_1_ack_out) & (1'b1 == m_axis_V_1_vld_out))) begin
            m_axis_V_1_sel_rd <= ~m_axis_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        m_axis_V_1_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == m_axis_V_1_vld_in) & (1'b1 == m_axis_V_1_ack_in))) begin
            m_axis_V_1_sel_wr <= ~m_axis_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        m_axis_V_1_state <= 2'd0;
    end else begin
        if ((((1'b0 == m_axis_V_1_vld_in) & (1'b1 == m_axis_V_1_ack_out) & (2'd3 == m_axis_V_1_state)) | ((1'b0 == m_axis_V_1_vld_in) & (2'd2 == m_axis_V_1_state)))) begin
            m_axis_V_1_state <= 2'd2;
        end else if ((((1'b1 == m_axis_V_1_vld_in) & (1'b0 == m_axis_V_1_ack_out) & (2'd3 == m_axis_V_1_state)) | ((1'b0 == m_axis_V_1_ack_out) & (2'd1 == m_axis_V_1_state)))) begin
            m_axis_V_1_state <= 2'd1;
        end else if ((((1'b1 == m_axis_V_1_vld_in) & (2'd2 == m_axis_V_1_state)) | ((1'b1 == m_axis_V_1_ack_out) & (2'd1 == m_axis_V_1_state)) | ((2'd3 == m_axis_V_1_state) & ~((1'b1 == m_axis_V_1_vld_in) & (1'b0 == m_axis_V_1_ack_out)) & ~((1'b0 == m_axis_V_1_vld_in) & (1'b1 == m_axis_V_1_ack_out))))) begin
            m_axis_V_1_state <= 2'd3;
        end else begin
            m_axis_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        s_axis_V_0_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == s_axis_V_0_ack_out) & (1'b1 == s_axis_V_0_vld_out))) begin
            s_axis_V_0_sel_rd <= ~s_axis_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        s_axis_V_0_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == s_axis_V_0_vld_in) & (1'b1 == s_axis_V_0_ack_in))) begin
            s_axis_V_0_sel_wr <= ~s_axis_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        s_axis_V_0_state <= 2'd0;
    end else begin
        if ((((1'b0 == s_axis_V_0_vld_in) & (1'b1 == s_axis_V_0_ack_out) & (s_axis_V_0_state == 2'd3)) | ((1'b0 == s_axis_V_0_vld_in) & (s_axis_V_0_state == 2'd2)))) begin
            s_axis_V_0_state <= 2'd2;
        end else if ((((1'b1 == s_axis_V_0_vld_in) & (1'b0 == s_axis_V_0_ack_out) & (s_axis_V_0_state == 2'd3)) | ((1'b0 == s_axis_V_0_ack_out) & (s_axis_V_0_state == 2'd1)))) begin
            s_axis_V_0_state <= 2'd1;
        end else if ((((1'b1 == s_axis_V_0_vld_in) & (s_axis_V_0_state == 2'd2)) | ((1'b1 == s_axis_V_0_ack_out) & (s_axis_V_0_state == 2'd1)) | ((s_axis_V_0_state == 2'd3) & ~((1'b1 == s_axis_V_0_vld_in) & (1'b0 == s_axis_V_0_ack_out)) & ~((1'b0 == s_axis_V_0_vld_in) & (1'b1 == s_axis_V_0_ack_out))))) begin
            s_axis_V_0_state <= 2'd3;
        end else begin
            s_axis_V_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (s_axis_V_0_vld_out == 1'b1))) begin
        Theta_reg_258 <= {{s_axis_V_0_data_out[47:32]}};
        Valpha_reg_252 <= Valpha_fu_73_p1;
        tmp_5_reg_263 <= {{s3vb_fu_245_p2[31:15]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        icmp3_reg_283 <= icmp3_fu_180_p2;
        icmp_reg_278 <= icmp_fu_164_p2;
        tmp_1_reg_268 <= {{tmp_6_fu_116_p2[17:1]}};
        tmp_4_reg_273 <= {{tmp_8_fu_138_p2[17:1]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == m_axis_V_1_load_A)) begin
        m_axis_V_1_payload_A <= res_fu_234_p5;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == m_axis_V_1_load_B)) begin
        m_axis_V_1_payload_B <= res_fu_234_p5;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == s_axis_V_0_load_A)) begin
        s_axis_V_0_payload_A <= s_axis_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == s_axis_V_0_load_B)) begin
        s_axis_V_0_payload_B <= s_axis_V_TDATA;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (m_axis_V_1_ack_in == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (m_axis_V_1_ack_in == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == m_axis_V_1_sel)) begin
        m_axis_V_1_data_out = m_axis_V_1_payload_B;
    end else begin
        m_axis_V_1_data_out = m_axis_V_1_payload_A;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (m_axis_V_1_ack_in == 1'b1))) begin
        m_axis_V_1_vld_in = 1'b1;
    end else begin
        m_axis_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5))) begin
        m_axis_V_TDATA_blk_n = m_axis_V_1_state[1'd1];
    end else begin
        m_axis_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (s_axis_V_0_vld_out == 1'b1))) begin
        s_axis_V_0_ack_out = 1'b1;
    end else begin
        s_axis_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == s_axis_V_0_sel)) begin
        s_axis_V_0_data_out = s_axis_V_0_payload_B;
    end else begin
        s_axis_V_0_data_out = s_axis_V_0_payload_A;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        s_axis_V_TDATA_blk_n = s_axis_V_0_state[1'd0];
    end else begin
        s_axis_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (s_axis_V_0_vld_out == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (m_axis_V_1_ack_in == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (m_axis_V_1_ack_in == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Valpha_fu_73_p1 = s_axis_V_0_data_out[15:0];

assign Vb_fu_186_p3 = ((icmp_reg_278[0:0] === 1'b1) ? 17'd32767 : tmp_1_reg_268);

assign Vbeta_fu_77_p4 = {{s_axis_V_0_data_out[31:16]}};

assign Vc_fu_198_p3 = ((icmp3_reg_283[0:0] === 1'b1) ? 17'd32767 : tmp_4_reg_273);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign icmp3_fu_180_p2 = ((tmp_2_fu_170_p4 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_fu_164_p2 = ((tmp_fu_154_p4 == 2'd1) ? 1'b1 : 1'b0);

assign m_axis_V_1_ack_in = m_axis_V_1_state[1'd1];

assign m_axis_V_1_ack_out = m_axis_V_TREADY;

assign m_axis_V_1_load_A = (m_axis_V_1_state_cmp_full & ~m_axis_V_1_sel_wr);

assign m_axis_V_1_load_B = (m_axis_V_1_sel_wr & m_axis_V_1_state_cmp_full);

assign m_axis_V_1_sel = m_axis_V_1_sel_rd;

assign m_axis_V_1_state_cmp_full = ((m_axis_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign m_axis_V_1_vld_out = m_axis_V_1_state[1'd0];

assign m_axis_V_TDATA = m_axis_V_1_data_out;

assign m_axis_V_TVALID = m_axis_V_1_state[1'd0];

assign res_fu_234_p5 = {{{{Theta_reg_258}, {tmp_12_fu_226_p3}}, {tmp_10_fu_214_p3}}, {Valpha_reg_252}};

assign s3vb_fu_245_p0 = 32'd56756;

assign s_axis_V_0_ack_in = s_axis_V_0_state[1'd1];

assign s_axis_V_0_load_A = (s_axis_V_0_state_cmp_full & ~s_axis_V_0_sel_wr);

assign s_axis_V_0_load_B = (s_axis_V_0_sel_wr & s_axis_V_0_state_cmp_full);

assign s_axis_V_0_sel = s_axis_V_0_sel_rd;

assign s_axis_V_0_state_cmp_full = ((s_axis_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign s_axis_V_0_vld_in = s_axis_V_TVALID;

assign s_axis_V_0_vld_out = s_axis_V_0_state[1'd0];

assign s_axis_V_TREADY = s_axis_V_0_state[1'd1];

assign sum_fu_132_p2 = ($signed(tmp_5_cast_fu_113_p1) + $signed(tmp_4_cast_fu_110_p1));

assign tmp_10_fu_214_p3 = ((tmp_7_fu_192_p2[0:0] === 1'b1) ? 16'd32769 : tmp_9_fu_210_p1);

assign tmp_11_fu_222_p1 = Vc_fu_198_p3[15:0];

assign tmp_12_fu_226_p3 = ((tmp_s_fu_204_p2[0:0] === 1'b1) ? 16'd32769 : tmp_11_fu_222_p1);

assign tmp_2_fu_170_p4 = {{tmp_8_fu_138_p2[17:16]}};

assign tmp_4_cast_fu_110_p1 = $signed(tmp_5_reg_263);

assign tmp_5_cast_fu_113_p1 = $signed(Valpha_reg_252);

assign tmp_6_fu_116_p2 = ($signed(tmp_4_cast_fu_110_p1) - $signed(tmp_5_cast_fu_113_p1));

assign tmp_7_fu_192_p2 = (($signed(Vb_fu_186_p3) < $signed(17'd98305)) ? 1'b1 : 1'b0);

assign tmp_8_fu_138_p2 = (18'd0 - sum_fu_132_p2);

assign tmp_9_fu_210_p1 = Vb_fu_186_p3[15:0];

assign tmp_fu_154_p4 = {{tmp_6_fu_116_p2[17:16]}};

assign tmp_s_fu_204_p2 = (($signed(Vc_fu_198_p3) < $signed(17'd98305)) ? 1'b1 : 1'b0);

endmodule //Clarke_Inverse
