-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.1
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PI_Control is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_V_TDATA : IN STD_LOGIC_VECTOR (15 downto 0);
    s_axis_V_TVALID : IN STD_LOGIC;
    s_axis_V_TREADY : OUT STD_LOGIC;
    m_axis_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    m_axis_V_TVALID : OUT STD_LOGIC;
    m_axis_V_TREADY : IN STD_LOGIC;
    Sp : IN STD_LOGIC_VECTOR (15 downto 0);
    Kp : IN STD_LOGIC_VECTOR (15 downto 0);
    Ki : IN STD_LOGIC_VECTOR (15 downto 0);
    mode : IN STD_LOGIC_VECTOR (31 downto 0);
    limit : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of PI_Control is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "PI_Control,hls_ip_2017_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.589500,HLS_SYN_LAT=8,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=5,HLS_SYN_FF=591,HLS_SYN_LUT=639}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (8 downto 0) := "000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (8 downto 0) := "000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (8 downto 0) := "000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (8 downto 0) := "000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (8 downto 0) := "000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (8 downto 0) := "001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (8 downto 0) := "010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv17_18001 : STD_LOGIC_VECTOR (16 downto 0) := "11000000000000001";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv17_7FFF : STD_LOGIC_VECTOR (16 downto 0) := "00111111111111111";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_37 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110111";
    constant ap_const_lv48_FFFFFFFF8001 : STD_LOGIC_VECTOR (47 downto 0) := "111111111111111111111111111111111000000000000001";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv33_0 : STD_LOGIC_VECTOR (32 downto 0) := "000000000000000000000000000000000";
    constant ap_const_lv16_8001 : STD_LOGIC_VECTOR (15 downto 0) := "1000000000000001";
    constant ap_const_lv16_7FFF : STD_LOGIC_VECTOR (15 downto 0) := "0111111111111111";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal s_axis_V_0_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal s_axis_V_0_vld_in : STD_LOGIC;
    signal s_axis_V_0_vld_out : STD_LOGIC;
    signal s_axis_V_0_ack_in : STD_LOGIC;
    signal s_axis_V_0_ack_out : STD_LOGIC;
    signal s_axis_V_0_payload_A : STD_LOGIC_VECTOR (15 downto 0);
    signal s_axis_V_0_payload_B : STD_LOGIC_VECTOR (15 downto 0);
    signal s_axis_V_0_sel_rd : STD_LOGIC := '0';
    signal s_axis_V_0_sel_wr : STD_LOGIC := '0';
    signal s_axis_V_0_sel : STD_LOGIC;
    signal s_axis_V_0_load_A : STD_LOGIC;
    signal s_axis_V_0_load_B : STD_LOGIC;
    signal s_axis_V_0_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal s_axis_V_0_state_cmp_full : STD_LOGIC;
    signal m_axis_V_1_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal m_axis_V_1_vld_in : STD_LOGIC;
    signal m_axis_V_1_vld_out : STD_LOGIC;
    signal m_axis_V_1_ack_in : STD_LOGIC;
    signal m_axis_V_1_ack_out : STD_LOGIC;
    signal m_axis_V_1_payload_A : STD_LOGIC_VECTOR (15 downto 0);
    signal m_axis_V_1_payload_B : STD_LOGIC_VECTOR (15 downto 0);
    signal m_axis_V_1_sel_rd : STD_LOGIC := '0';
    signal m_axis_V_1_sel_wr : STD_LOGIC := '0';
    signal m_axis_V_1_sel : STD_LOGIC;
    signal m_axis_V_1_load_A : STD_LOGIC;
    signal m_axis_V_1_load_B : STD_LOGIC;
    signal m_axis_V_1_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal m_axis_V_1_state_cmp_full : STD_LOGIC;
    signal Mode_prev : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal GiE_prev : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal s_axis_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal m_axis_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal Err_fu_173_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal Err_reg_362 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_6_fu_185_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_reg_367 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal Err_cast_fu_197_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal Err_cast_reg_377 : STD_LOGIC_VECTOR (31 downto 0);
    signal x_assign_1_fu_211_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal x_assign_1_reg_382 : STD_LOGIC_VECTOR (31 downto 0);
    signal x_min_assign_fu_217_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal x_min_assign_reg_387 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_s_fu_223_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_s_reg_392 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_229_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_reg_397 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal val_assign_fu_357_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal val_assign_reg_412 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal tmp_9_reg_417 : STD_LOGIC_VECTOR (39 downto 0);
    signal r_V_1_fu_290_p2 : STD_LOGIC_VECTOR (89 downto 0);
    signal r_V_1_reg_422 : STD_LOGIC_VECTOR (89 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal tmp_5_fu_306_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_5_reg_427 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp8_fu_322_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp8_reg_433 : STD_LOGIC_VECTOR (0 downto 0);
    signal Res_Out_fu_348_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal GiE_fu_240_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_cast_fu_123_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_2_cast_fu_127_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal x_assign_fu_131_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_fu_143_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_4_fu_137_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_fu_153_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_fu_167_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal x_max_x_i1_cast_fu_159_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_7_fu_204_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal x_max_x_i_fu_235_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_254_p2 : STD_LOGIC_VECTOR (47 downto 0);
    signal tmp_2_fu_280_p1 : STD_LOGIC_VECTOR (87 downto 0);
    signal lhs_V_1_cast_fu_283_p1 : STD_LOGIC_VECTOR (89 downto 0);
    signal tmp_10_cast_fu_286_p1 : STD_LOGIC_VECTOR (89 downto 0);
    signal phitmp_fu_296_p4 : STD_LOGIC_VECTOR (47 downto 0);
    signal tmp_10_fu_312_p4 : STD_LOGIC_VECTOR (32 downto 0);
    signal tmp_11_fu_344_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_phitmp1_fu_337_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal phitmp1_fu_328_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal val_assign_fu_357_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (8 downto 0);

    component PI_Control_mul_16bkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (47 downto 0) );
    end component;


    component PI_Control_mul_mucud IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (16 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    PI_Control_mul_16bkb_U0 : component PI_Control_mul_16bkb
    generic map (
        ID => 1,
        NUM_STAGE => 3,
        din0_WIDTH => 16,
        din1_WIDTH => 32,
        dout_WIDTH => 48)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => Ki,
        din1 => GiE_fu_240_p3,
        ce => ap_const_logic_1,
        dout => grp_fu_254_p2);

    PI_Control_mul_mucud_U1 : component PI_Control_mul_mucud
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 17,
        dout_WIDTH => 32)
    port map (
        din0 => Kp,
        din1 => val_assign_fu_357_p1,
        dout => val_assign_fu_357_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    m_axis_V_1_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                m_axis_V_1_sel_rd <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = m_axis_V_1_ack_out) and (ap_const_logic_1 = m_axis_V_1_vld_out))) then 
                                        m_axis_V_1_sel_rd <= not(m_axis_V_1_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    m_axis_V_1_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                m_axis_V_1_sel_wr <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_logic_1 = m_axis_V_1_ack_in))) then 
                                        m_axis_V_1_sel_wr <= not(m_axis_V_1_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    m_axis_V_1_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                m_axis_V_1_state <= ap_const_lv2_0;
            else
                if ((((ap_const_logic_0 = m_axis_V_1_vld_in) and (ap_const_logic_1 = m_axis_V_1_ack_out) and (ap_const_lv2_3 = m_axis_V_1_state)) or ((ap_const_logic_0 = m_axis_V_1_vld_in) and (ap_const_lv2_2 = m_axis_V_1_state)))) then 
                    m_axis_V_1_state <= ap_const_lv2_2;
                elsif ((((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_logic_0 = m_axis_V_1_ack_out) and (ap_const_lv2_3 = m_axis_V_1_state)) or ((ap_const_logic_0 = m_axis_V_1_ack_out) and (ap_const_lv2_1 = m_axis_V_1_state)))) then 
                    m_axis_V_1_state <= ap_const_lv2_1;
                elsif ((((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_lv2_2 = m_axis_V_1_state)) or ((ap_const_logic_1 = m_axis_V_1_ack_out) and (ap_const_lv2_1 = m_axis_V_1_state)) or ((ap_const_lv2_3 = m_axis_V_1_state) and not(((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_logic_0 = m_axis_V_1_ack_out))) and not(((ap_const_logic_0 = m_axis_V_1_vld_in) and (ap_const_logic_1 = m_axis_V_1_ack_out)))))) then 
                    m_axis_V_1_state <= ap_const_lv2_3;
                else 
                    m_axis_V_1_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;


    s_axis_V_0_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                s_axis_V_0_sel_rd <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = s_axis_V_0_ack_out) and (ap_const_logic_1 = s_axis_V_0_vld_out))) then 
                                        s_axis_V_0_sel_rd <= not(s_axis_V_0_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    s_axis_V_0_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                s_axis_V_0_sel_wr <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = s_axis_V_0_vld_in) and (ap_const_logic_1 = s_axis_V_0_ack_in))) then 
                                        s_axis_V_0_sel_wr <= not(s_axis_V_0_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    s_axis_V_0_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                s_axis_V_0_state <= ap_const_lv2_0;
            else
                if ((((ap_const_logic_0 = s_axis_V_0_vld_in) and (ap_const_logic_1 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_3)) or ((ap_const_logic_0 = s_axis_V_0_vld_in) and (s_axis_V_0_state = ap_const_lv2_2)))) then 
                    s_axis_V_0_state <= ap_const_lv2_2;
                elsif ((((ap_const_logic_1 = s_axis_V_0_vld_in) and (ap_const_logic_0 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_3)) or ((ap_const_logic_0 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_1)))) then 
                    s_axis_V_0_state <= ap_const_lv2_1;
                elsif ((((ap_const_logic_1 = s_axis_V_0_vld_in) and (s_axis_V_0_state = ap_const_lv2_2)) or ((ap_const_logic_1 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_1)) or ((s_axis_V_0_state = ap_const_lv2_3) and not(((ap_const_logic_1 = s_axis_V_0_vld_in) and (ap_const_logic_0 = s_axis_V_0_ack_out))) and not(((ap_const_logic_0 = s_axis_V_0_vld_in) and (ap_const_logic_1 = s_axis_V_0_ack_out)))))) then 
                    s_axis_V_0_state <= ap_const_lv2_3;
                else 
                    s_axis_V_0_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                Err_cast_reg_377 <= Err_cast_fu_197_p1;
                tmp_3_reg_397 <= tmp_3_fu_229_p2;
                tmp_s_reg_392 <= tmp_s_fu_223_p2;
                x_assign_1_reg_382 <= x_assign_1_fu_211_p2;
                x_min_assign_reg_387 <= x_min_assign_fu_217_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then
                Err_reg_362 <= Err_fu_173_p3;
                Mode_prev <= mode;
                tmp_6_reg_367 <= tmp_6_fu_185_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                GiE_prev <= GiE_fu_240_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                icmp8_reg_433 <= icmp8_fu_322_p2;
                r_V_1_reg_422 <= r_V_1_fu_290_p2;
                tmp_5_reg_427 <= tmp_5_fu_306_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = m_axis_V_1_load_A)) then
                m_axis_V_1_payload_A <= Res_Out_fu_348_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = m_axis_V_1_load_B)) then
                m_axis_V_1_payload_B <= Res_Out_fu_348_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = s_axis_V_0_load_A)) then
                s_axis_V_0_payload_A <= s_axis_V_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = s_axis_V_0_load_B)) then
                s_axis_V_0_payload_B <= s_axis_V_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                tmp_9_reg_417 <= grp_fu_254_p2(47 downto 8);
                val_assign_reg_412 <= val_assign_fu_357_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, s_axis_V_0_vld_out, m_axis_V_1_ack_in, ap_CS_fsm_state2, ap_CS_fsm_state8, ap_CS_fsm_state9)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state8) and (m_axis_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when ap_ST_fsm_state9 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state9) and (m_axis_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXX";
        end case;
    end process;
        Err_cast_fu_197_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Err_reg_362),32));

    Err_fu_173_p3 <= 
        x_max_x_i1_cast_fu_159_p3 when (tmp_1_fu_167_p2(0) = '1') else 
        x_assign_fu_131_p2;
    GiE_fu_240_p3 <= 
        x_min_assign_reg_387 when (tmp_s_reg_392(0) = '1') else 
        x_max_x_i_fu_235_p3;
    Res_Out_fu_348_p3 <= 
        p_phitmp1_fu_337_p3 when (tmp_11_fu_344_p2(0) = '1') else 
        phitmp1_fu_328_p4;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_done_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    icmp8_fu_322_p2 <= "1" when (signed(tmp_10_fu_312_p4) > signed(ap_const_lv33_0)) else "0";
    icmp_fu_153_p2 <= "1" when (tmp_fu_143_p4 = ap_const_lv2_1) else "0";
        lhs_V_1_cast_fu_283_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(val_assign_reg_412),90));

    m_axis_V_1_ack_in <= m_axis_V_1_state(1);
    m_axis_V_1_ack_out <= m_axis_V_TREADY;

    m_axis_V_1_data_out_assign_proc : process(m_axis_V_1_payload_A, m_axis_V_1_payload_B, m_axis_V_1_sel)
    begin
        if ((ap_const_logic_1 = m_axis_V_1_sel)) then 
            m_axis_V_1_data_out <= m_axis_V_1_payload_B;
        else 
            m_axis_V_1_data_out <= m_axis_V_1_payload_A;
        end if; 
    end process;

    m_axis_V_1_load_A <= (m_axis_V_1_state_cmp_full and not(m_axis_V_1_sel_wr));
    m_axis_V_1_load_B <= (m_axis_V_1_sel_wr and m_axis_V_1_state_cmp_full);
    m_axis_V_1_sel <= m_axis_V_1_sel_rd;
    m_axis_V_1_state_cmp_full <= '0' when (m_axis_V_1_state = ap_const_lv2_1) else '1';

    m_axis_V_1_vld_in_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state8)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            m_axis_V_1_vld_in <= ap_const_logic_1;
        else 
            m_axis_V_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    m_axis_V_1_vld_out <= m_axis_V_1_state(0);
    m_axis_V_TDATA <= m_axis_V_1_data_out;

    m_axis_V_TDATA_blk_n_assign_proc : process(m_axis_V_1_state, ap_CS_fsm_state8, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state9))) then 
            m_axis_V_TDATA_blk_n <= m_axis_V_1_state(1);
        else 
            m_axis_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_V_TVALID <= m_axis_V_1_state(0);
    p_phitmp1_fu_337_p3 <= 
        ap_const_lv16_8001 when (tmp_5_reg_427(0) = '1') else 
        ap_const_lv16_7FFF;
    phitmp1_fu_328_p4 <= r_V_1_reg_422(23 downto 8);
    phitmp_fu_296_p4 <= r_V_1_fu_290_p2(55 downto 8);
    r_V_1_fu_290_p2 <= std_logic_vector(signed(lhs_V_1_cast_fu_283_p1) + signed(tmp_10_cast_fu_286_p1));
    s_axis_V_0_ack_in <= s_axis_V_0_state(1);

    s_axis_V_0_ack_out_assign_proc : process(s_axis_V_0_vld_out, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then 
            s_axis_V_0_ack_out <= ap_const_logic_1;
        else 
            s_axis_V_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    s_axis_V_0_data_out_assign_proc : process(s_axis_V_0_payload_A, s_axis_V_0_payload_B, s_axis_V_0_sel)
    begin
        if ((ap_const_logic_1 = s_axis_V_0_sel)) then 
            s_axis_V_0_data_out <= s_axis_V_0_payload_B;
        else 
            s_axis_V_0_data_out <= s_axis_V_0_payload_A;
        end if; 
    end process;

    s_axis_V_0_load_A <= (s_axis_V_0_state_cmp_full and not(s_axis_V_0_sel_wr));
    s_axis_V_0_load_B <= (s_axis_V_0_sel_wr and s_axis_V_0_state_cmp_full);
    s_axis_V_0_sel <= s_axis_V_0_sel_rd;
    s_axis_V_0_state_cmp_full <= '0' when (s_axis_V_0_state = ap_const_lv2_1) else '1';
    s_axis_V_0_vld_in <= s_axis_V_TVALID;
    s_axis_V_0_vld_out <= s_axis_V_0_state(0);

    s_axis_V_TDATA_blk_n_assign_proc : process(s_axis_V_0_state, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            s_axis_V_TDATA_blk_n <= s_axis_V_0_state(0);
        else 
            s_axis_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s_axis_V_TREADY <= s_axis_V_0_state(1);
    tmp_10_cast_fu_286_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_2_fu_280_p1),90));
    tmp_10_fu_312_p4 <= r_V_1_fu_290_p2(55 downto 23);
    tmp_11_fu_344_p2 <= (tmp_5_reg_427 or icmp8_reg_433);
        tmp_1_cast_fu_123_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Sp),17));

    tmp_1_fu_167_p2 <= (tmp_4_fu_137_p2 or icmp_fu_153_p2);
        tmp_2_cast_fu_127_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(s_axis_V_0_data_out),17));

        tmp_2_fu_280_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_9_reg_417),88));

    tmp_3_fu_229_p2 <= "1" when (signed(x_assign_1_fu_211_p2) > signed(limit)) else "0";
    tmp_4_fu_137_p2 <= "1" when (signed(x_assign_fu_131_p2) < signed(ap_const_lv17_18001)) else "0";
    tmp_5_fu_306_p2 <= "1" when (signed(phitmp_fu_296_p4) < signed(ap_const_lv48_FFFFFFFF8001)) else "0";
    tmp_6_fu_185_p2 <= "1" when (Mode_prev = mode) else "0";
    tmp_7_fu_204_p3 <= 
        GiE_prev when (tmp_6_reg_367(0) = '1') else 
        ap_const_lv32_0;
    tmp_fu_143_p4 <= x_assign_fu_131_p2(16 downto 15);
    tmp_s_fu_223_p2 <= "1" when (signed(x_assign_1_fu_211_p2) < signed(x_min_assign_fu_217_p2)) else "0";
    val_assign_fu_357_p1 <= Err_cast_reg_377(17 - 1 downto 0);
    x_assign_1_fu_211_p2 <= std_logic_vector(signed(Err_cast_fu_197_p1) + signed(tmp_7_fu_204_p3));
    x_assign_fu_131_p2 <= std_logic_vector(signed(tmp_1_cast_fu_123_p1) - signed(tmp_2_cast_fu_127_p1));
    x_max_x_i1_cast_fu_159_p3 <= 
        ap_const_lv17_18001 when (tmp_4_fu_137_p2(0) = '1') else 
        ap_const_lv17_7FFF;
    x_max_x_i_fu_235_p3 <= 
        limit when (tmp_3_reg_397(0) = '1') else 
        x_assign_1_reg_382;
    x_min_assign_fu_217_p2 <= std_logic_vector(unsigned(ap_const_lv32_0) - unsigned(limit));
end behav;
