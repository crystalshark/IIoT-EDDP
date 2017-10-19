-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.1
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Park_Direct is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_V_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    s_axis_V_TVALID : IN STD_LOGIC;
    s_axis_V_TREADY : OUT STD_LOGIC;
    m_axis_V_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_V_TVALID : OUT STD_LOGIC;
    m_axis_V_TREADY : IN STD_LOGIC;
    Id_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    Id_out_ap_vld : OUT STD_LOGIC;
    Iq_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    Iq_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of Park_Direct is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "Park_Direct,hls_ip_2017_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.450000,HLS_SYN_LAT=6,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=4,HLS_SYN_FF=533,HLS_SYN_LUT=211}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (6 downto 0) := "0000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (6 downto 0) := "0000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (6 downto 0) := "0001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (6 downto 0) := "0100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv17_7FFF : STD_LOGIC_VECTOR (16 downto 0) := "00111111111111111";
    constant ap_const_lv17_18001 : STD_LOGIC_VECTOR (16 downto 0) := "11000000000000001";
    constant ap_const_lv16_8001 : STD_LOGIC_VECTOR (15 downto 0) := "1000000000000001";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal s_axis_V_0_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal s_axis_V_0_vld_in : STD_LOGIC;
    signal s_axis_V_0_vld_out : STD_LOGIC;
    signal s_axis_V_0_ack_in : STD_LOGIC;
    signal s_axis_V_0_ack_out : STD_LOGIC;
    signal s_axis_V_0_payload_A : STD_LOGIC_VECTOR (63 downto 0);
    signal s_axis_V_0_payload_B : STD_LOGIC_VECTOR (63 downto 0);
    signal s_axis_V_0_sel_rd : STD_LOGIC := '0';
    signal s_axis_V_0_sel_wr : STD_LOGIC := '0';
    signal s_axis_V_0_sel : STD_LOGIC;
    signal s_axis_V_0_load_A : STD_LOGIC;
    signal s_axis_V_0_load_B : STD_LOGIC;
    signal s_axis_V_0_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal s_axis_V_0_state_cmp_full : STD_LOGIC;
    signal m_axis_V_1_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal m_axis_V_1_vld_in : STD_LOGIC;
    signal m_axis_V_1_vld_out : STD_LOGIC;
    signal m_axis_V_1_ack_in : STD_LOGIC;
    signal m_axis_V_1_ack_out : STD_LOGIC;
    signal m_axis_V_1_payload_A : STD_LOGIC_VECTOR (63 downto 0);
    signal m_axis_V_1_payload_B : STD_LOGIC_VECTOR (63 downto 0);
    signal m_axis_V_1_sel_rd : STD_LOGIC := '0';
    signal m_axis_V_1_sel_wr : STD_LOGIC := '0';
    signal m_axis_V_1_sel : STD_LOGIC;
    signal m_axis_V_1_load_A : STD_LOGIC;
    signal m_axis_V_1_load_B : STD_LOGIC;
    signal m_axis_V_1_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal m_axis_V_1_state_cmp_full : STD_LOGIC;
    signal cos_table_address0 : STD_LOGIC_VECTOR (9 downto 0);
    signal cos_table_ce0 : STD_LOGIC;
    signal cos_table_q0 : STD_LOGIC_VECTOR (15 downto 0);
    signal sin_table_address0 : STD_LOGIC_VECTOR (9 downto 0);
    signal sin_table_ce0 : STD_LOGIC;
    signal sin_table_q0 : STD_LOGIC_VECTOR (15 downto 0);
    signal s_axis_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal m_axis_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal Ialpha_fu_119_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal Ialpha_reg_315 : STD_LOGIC_VECTOR (15 downto 0);
    signal Ibeta_reg_320 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_10_reg_335 : STD_LOGIC_VECTOR (31 downto 0);
    signal cos_table_load_reg_340 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal sin_table_load_reg_345 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_5_fu_162_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_5_reg_350 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal Ia_cos_fu_287_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal Ia_cos_reg_355 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_6_fu_165_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_6_reg_360 : STD_LOGIC_VECTOR (31 downto 0);
    signal Ib_cos_fu_293_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal Ib_cos_reg_365 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_reg_370 : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal tmp_2_reg_375 : STD_LOGIC_VECTOR (16 downto 0);
    signal icmp_fu_198_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_reg_380 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp3_fu_213_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp3_reg_385 : STD_LOGIC_VECTOR (0 downto 0);
    signal res_fu_277_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_4_fu_143_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_reg_ioackin_Id_out_dummy_ack : STD_LOGIC := '0';
    signal ap_reg_ioackin_Iq_out_dummy_ack : STD_LOGIC := '0';
    signal Theta_fu_133_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_299_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_307_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_189_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_12_fu_204_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal Id_fu_219_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_8_fu_229_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_225_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal Id_1_fu_235_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal Iq_fu_248_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_s_fu_258_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_13_fu_254_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal Iq_1_fu_264_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal Ia_cos_fu_287_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal cos_theta_fu_159_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal Ib_cos_fu_293_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_299_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_299_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal sin_theta_fu_168_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_307_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_307_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (6 downto 0);

    component Park_Direct_mul_mdEe IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component Park_Direct_mac_meOg IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component Park_Direct_mac_mfYi IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component Park_Direct_cos_tbkb IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (9 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component Park_Direct_sin_tcud IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (9 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;



begin
    cos_table_U : component Park_Direct_cos_tbkb
    generic map (
        DataWidth => 16,
        AddressRange => 1000,
        AddressWidth => 10)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => cos_table_address0,
        ce0 => cos_table_ce0,
        q0 => cos_table_q0);

    sin_table_U : component Park_Direct_sin_tcud
    generic map (
        DataWidth => 16,
        AddressRange => 1000,
        AddressWidth => 10)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => sin_table_address0,
        ce0 => sin_table_ce0,
        q0 => sin_table_q0);

    Park_Direct_mul_mdEe_U0 : component Park_Direct_mul_mdEe
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        din0 => Ia_cos_fu_287_p0,
        din1 => Ialpha_reg_315,
        dout => Ia_cos_fu_287_p2);

    Park_Direct_mul_mdEe_U1 : component Park_Direct_mul_mdEe
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        din0 => Ib_cos_fu_293_p0,
        din1 => Ibeta_reg_320,
        dout => Ib_cos_fu_293_p2);

    Park_Direct_mac_meOg_U2 : component Park_Direct_mac_meOg
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        din0 => grp_fu_299_p0,
        din1 => grp_fu_299_p1,
        din2 => Ia_cos_reg_355,
        dout => grp_fu_299_p3);

    Park_Direct_mac_mfYi_U3 : component Park_Direct_mac_mfYi
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        din0 => grp_fu_307_p0,
        din1 => grp_fu_307_p1,
        din2 => Ib_cos_reg_365,
        dout => grp_fu_307_p3);





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


    ap_reg_ioackin_Id_out_dummy_ack_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ioackin_Id_out_dummy_ack <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                    if ((m_axis_V_1_ack_in = ap_const_logic_1)) then 
                        ap_reg_ioackin_Id_out_dummy_ack <= ap_const_logic_0;
                    elsif ((ap_const_logic_1 = ap_const_logic_1)) then 
                        ap_reg_ioackin_Id_out_dummy_ack <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_Iq_out_dummy_ack_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ioackin_Iq_out_dummy_ack <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                    if ((m_axis_V_1_ack_in = ap_const_logic_1)) then 
                        ap_reg_ioackin_Iq_out_dummy_ack <= ap_const_logic_0;
                    elsif ((ap_const_logic_1 = ap_const_logic_1)) then 
                        ap_reg_ioackin_Iq_out_dummy_ack <= ap_const_logic_1;
                    end if;
                end if; 
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
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                Ia_cos_reg_355 <= Ia_cos_fu_287_p2;
                Ib_cos_reg_365 <= Ib_cos_fu_293_p2;
                tmp_5_reg_350 <= tmp_5_fu_162_p1;
                tmp_6_reg_360 <= tmp_6_fu_165_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then
                Ialpha_reg_315 <= Ialpha_fu_119_p1;
                Ibeta_reg_320 <= s_axis_V_0_data_out(31 downto 16);
                tmp_10_reg_335 <= s_axis_V_0_data_out(63 downto 32);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                cos_table_load_reg_340 <= cos_table_q0;
                sin_table_load_reg_345 <= sin_table_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                icmp3_reg_385 <= icmp3_fu_213_p2;
                icmp_reg_380 <= icmp_fu_198_p2;
                tmp_1_reg_370 <= grp_fu_299_p3(31 downto 15);
                tmp_2_reg_375 <= grp_fu_307_p3(31 downto 15);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = m_axis_V_1_load_A)) then
                m_axis_V_1_payload_A <= res_fu_277_p4;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = m_axis_V_1_load_B)) then
                m_axis_V_1_payload_B <= res_fu_277_p4;
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

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, s_axis_V_0_vld_out, m_axis_V_1_ack_in, ap_CS_fsm_state2, ap_CS_fsm_state6, ap_CS_fsm_state7)
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
                if (((ap_const_logic_1 = ap_CS_fsm_state6) and (m_axis_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state7 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state7) and (m_axis_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXX";
        end case;
    end process;
    Ia_cos_fu_287_p0 <= cos_theta_fu_159_p1(16 - 1 downto 0);
    Ialpha_fu_119_p1 <= s_axis_V_0_data_out(16 - 1 downto 0);
    Ib_cos_fu_293_p0 <= cos_theta_fu_159_p1(16 - 1 downto 0);
    Id_1_fu_235_p3 <= 
        ap_const_lv16_8001 when (tmp_8_fu_229_p2(0) = '1') else 
        tmp_3_fu_225_p1;
    Id_fu_219_p3 <= 
        ap_const_lv17_7FFF when (icmp_reg_380(0) = '1') else 
        tmp_1_reg_370;
        Id_out <= std_logic_vector(IEEE.numeric_std.resize(signed(Id_1_fu_235_p3),32));


    Id_out_ap_vld_assign_proc : process(ap_CS_fsm_state6, ap_reg_ioackin_Id_out_dummy_ack)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) and (ap_const_logic_0 = ap_reg_ioackin_Id_out_dummy_ack))) then 
            Id_out_ap_vld <= ap_const_logic_1;
        else 
            Id_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    Iq_1_fu_264_p3 <= 
        ap_const_lv16_8001 when (tmp_s_fu_258_p2(0) = '1') else 
        tmp_13_fu_254_p1;
    Iq_fu_248_p3 <= 
        ap_const_lv17_7FFF when (icmp3_reg_385(0) = '1') else 
        tmp_2_reg_375;
        Iq_out <= std_logic_vector(IEEE.numeric_std.resize(signed(Iq_1_fu_264_p3),32));


    Iq_out_ap_vld_assign_proc : process(ap_CS_fsm_state6, ap_reg_ioackin_Iq_out_dummy_ack)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) and (ap_const_logic_0 = ap_reg_ioackin_Iq_out_dummy_ack))) then 
            Iq_out_ap_vld <= ap_const_logic_1;
        else 
            Iq_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    Theta_fu_133_p4 <= s_axis_V_0_data_out(63 downto 48);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);

    ap_done_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state7)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state7) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
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


    ap_ready_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state7)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state7) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    cos_table_address0 <= tmp_4_fu_143_p1(10 - 1 downto 0);

    cos_table_ce0_assign_proc : process(s_axis_V_0_vld_out, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then 
            cos_table_ce0 <= ap_const_logic_1;
        else 
            cos_table_ce0 <= ap_const_logic_0;
        end if; 
    end process;

        cos_theta_fu_159_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cos_table_load_reg_340),32));

    grp_fu_299_p0 <= tmp_6_reg_360(16 - 1 downto 0);
    grp_fu_299_p1 <= sin_theta_fu_168_p1(16 - 1 downto 0);
    grp_fu_307_p0 <= tmp_5_reg_350(16 - 1 downto 0);
    grp_fu_307_p1 <= sin_theta_fu_168_p1(16 - 1 downto 0);
    icmp3_fu_213_p2 <= "1" when (tmp_12_fu_204_p4 = ap_const_lv2_1) else "0";
    icmp_fu_198_p2 <= "1" when (tmp_fu_189_p4 = ap_const_lv2_1) else "0";
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

    m_axis_V_1_vld_in_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            m_axis_V_1_vld_in <= ap_const_logic_1;
        else 
            m_axis_V_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    m_axis_V_1_vld_out <= m_axis_V_1_state(0);
    m_axis_V_TDATA <= m_axis_V_1_data_out;

    m_axis_V_TDATA_blk_n_assign_proc : process(m_axis_V_1_state, ap_CS_fsm_state6, ap_CS_fsm_state7)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            m_axis_V_TDATA_blk_n <= m_axis_V_1_state(1);
        else 
            m_axis_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_V_TVALID <= m_axis_V_1_state(0);
    res_fu_277_p4 <= ((tmp_10_reg_335 & Iq_1_fu_264_p3) & Id_1_fu_235_p3);
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
    sin_table_address0 <= tmp_4_fu_143_p1(10 - 1 downto 0);

    sin_table_ce0_assign_proc : process(s_axis_V_0_vld_out, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then 
            sin_table_ce0 <= ap_const_logic_1;
        else 
            sin_table_ce0 <= ap_const_logic_0;
        end if; 
    end process;

        sin_theta_fu_168_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sin_table_load_reg_345),32));

    tmp_12_fu_204_p4 <= grp_fu_307_p3(31 downto 30);
    tmp_13_fu_254_p1 <= Iq_fu_248_p3(16 - 1 downto 0);
    tmp_3_fu_225_p1 <= Id_fu_219_p3(16 - 1 downto 0);
        tmp_4_fu_143_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Theta_fu_133_p4),32));

        tmp_5_fu_162_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Ialpha_reg_315),32));

        tmp_6_fu_165_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Ibeta_reg_320),32));

    tmp_8_fu_229_p2 <= "1" when (signed(Id_fu_219_p3) < signed(ap_const_lv17_18001)) else "0";
    tmp_fu_189_p4 <= grp_fu_299_p3(31 downto 30);
    tmp_s_fu_258_p2 <= "1" when (signed(Iq_fu_248_p3) < signed(ap_const_lv17_18001)) else "0";
end behav;
