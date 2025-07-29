//******************************************************************************
//  file:     system_wrapper.v
//
//  author:   JAY CONVERTINO
//
//  date:     2025/07/09
//
//  about:    Brief
//  System wrapper for hitech linux example
//
//  license: License MIT
//  Copyright 2025 Jay Convertino
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//******************************************************************************

/*
 * Module: system_wrapper
 *
 * System wrapper for pl and ps for hitech linux example
 *
 */
module system_wrapper (
    input   [12:0]  gpio_bd_i,
    output  [ 7:0]  gpio_bd_o
  );

  // internal signals

  wire    [94:0]  gpio_i;
  wire    [94:0]  gpio_o;

  //PS TO PL / PL TO PS signals

  wire        s_axi_clk;
  wire        s_axi_aresetn;

  // instantiations... copy pasta

  // defaults

  assign gpio_i[94:13] = gpio_o[94:13];
  assign gpio_i[12:0]  = gpio_bd_i;
  assign gpio_bd_o     = gpio_o[7:0];


  // Module: inst_system_ps_wrapper
  //
  // Module instance of inst_system_ps_wrapper for the built in CPU.
  system_ps_wrapper inst_system_ps_wrapper (
    .M_AXI_araddr(),
    .M_AXI_arprot(),
    .M_AXI_arready(1'b0),
    .M_AXI_arvalid(),
    .M_AXI_awaddr(),
    .M_AXI_awprot(),
    .M_AXI_awready(1'b0),
    .M_AXI_awvalid(),
    .M_AXI_bready(),
    .M_AXI_bresp(2'b00),
    .M_AXI_bvalid(1'b0),
    .M_AXI_rdata(0),
    .M_AXI_rready(),
    .M_AXI_rresp(2'b00),
    .M_AXI_rvalid(1'b0),
    .M_AXI_wdata(),
    .M_AXI_wready(1'b0),
    .M_AXI_wstrb(),
    .M_AXI_wvalid(),
    .S_AXI_HP0_arready(),
    .S_AXI_HP0_awready(),
    .S_AXI_HP0_bvalid(),
    .S_AXI_HP0_rlast(),
    .S_AXI_HP0_rvalid(),
    .S_AXI_HP0_wready(),
    .S_AXI_HP0_bresp(),
    .S_AXI_HP0_rresp(),
    .S_AXI_HP0_bid(),
    .S_AXI_HP0_rid(),
    .S_AXI_HP0_rdata(),
    .S_AXI_HP0_ACLK(s_axi_clk),
    .S_AXI_HP0_arvalid(1'b0),
    .S_AXI_HP0_awvalid(1'b0),
    .S_AXI_HP0_bready(1'b0),
    .S_AXI_HP0_rready(1'b0),
    .S_AXI_HP0_wlast(1'b0),
    .S_AXI_HP0_wvalid(1'b0),
    .S_AXI_HP0_arburst(2'b01),
    .S_AXI_HP0_arlock(0),
    .S_AXI_HP0_arsize(3'b011),
    .S_AXI_HP0_awburst(2'b01),
    .S_AXI_HP0_awlock(0),
    .S_AXI_HP0_awsize(3'b011),
    .S_AXI_HP0_arprot(0),
    .S_AXI_HP0_awprot(0),
    .S_AXI_HP0_araddr(0),
    .S_AXI_HP0_awaddr(0),
    .S_AXI_HP0_arcache(4'b0011),
    .S_AXI_HP0_arlen(0),
    .S_AXI_HP0_arqos(0),
    .S_AXI_HP0_awcache(4'b0011),
    .S_AXI_HP0_awlen(0),
    .S_AXI_HP0_awqos(0),
    .S_AXI_HP0_arid(0),
    .S_AXI_HP0_awid(0),
    .S_AXI_HP0_wdata(0),
    .S_AXI_HP0_wstrb(~0),
    .S_AXI_HP0_aruser(1'b0),
    .S_AXI_HP0_awuser(1'b0),
    .S_AXI_HP1_arready(),
    .S_AXI_HP1_awready(),
    .S_AXI_HP1_bvalid(),
    .S_AXI_HP1_rlast(),
    .S_AXI_HP1_rvalid(),
    .S_AXI_HP1_wready(),
    .S_AXI_HP1_bresp(),
    .S_AXI_HP1_rresp(),
    .S_AXI_HP1_bid(),
    .S_AXI_HP1_rid(),
    .S_AXI_HP1_rdata(),
    .S_AXI_HP1_ACLK(s_axi_clk),
    .S_AXI_HP1_arvalid(1'b0),
    .S_AXI_HP1_awvalid(1'b0),
    .S_AXI_HP1_bready(1'b0),
    .S_AXI_HP1_rready(1'b0),
    .S_AXI_HP1_wlast(1'b0),
    .S_AXI_HP1_wvalid(1'b0),
    .S_AXI_HP1_arburst(0),
    .S_AXI_HP1_arlock(0),
    .S_AXI_HP1_arsize(3'b011),
    .S_AXI_HP1_awburst(2'b01),
    .S_AXI_HP1_awlock(0),
    .S_AXI_HP1_awsize(3'b011),
    .S_AXI_HP1_arprot(0),
    .S_AXI_HP1_awprot(0),
    .S_AXI_HP1_araddr(0),
    .S_AXI_HP1_awaddr(0),
    .S_AXI_HP1_arcache(4'b0011),
    .S_AXI_HP1_arlen(0),
    .S_AXI_HP1_arqos(0),
    .S_AXI_HP1_awcache(4'b0011),
    .S_AXI_HP1_awlen(0),
    .S_AXI_HP1_awqos(0),
    .S_AXI_HP1_arid(0),
    .S_AXI_HP1_awid(0),
    .S_AXI_HP1_wdata(0),
    .S_AXI_HP1_wstrb(~0),
    .S_AXI_HP1_aruser(1'b0),
    .S_AXI_HP1_awuser(1'b0),
    .gpio_i(gpio_i),
    .gpio_o(gpio_o),
    .gpio_t(),
    .peripheral_aresetn(s_axi_aresetn),
    .pl_clk0(s_axi_clk),
    .pl_clk1(),
    .pl_clk2(),
    .pl_ps_irq1({8{1'b0}}),
    .spi0_m_i(1'b0),
    .spi0_m_o(),
    .spi0_mo_t(),
    .spi0_s_i(1'b0),
    .spi0_s_o(),
    .spi0_sclk_i(1'b0),
    .spi0_sclk_o(),
    .spi0_sclk_t(),
    .spi0_so_t(),
    .spi0_ss1_o_n(),
    .spi0_ss2_o_n(),
    .spi0_ss_i_n(1'b1),
    .spi0_ss_n_t(),
    .spi0_ss_o_n(),
    .spi1_m_i(1'b0),
    .spi1_m_o(),
    .spi1_mo_t(),
    .spi1_s_i(1'b0),
    .spi1_s_o(),
    .spi1_sclk_i(1'b0),
    .spi1_sclk_o(),
    .spi1_sclk_t(),
    .spi1_so_t(),
    .spi1_ss1_o_n(),
    .spi1_ss2_o_n(),
    .spi1_ss_i_n(1'b1),
    .spi1_ss_n_t(),
    .spi1_ss_o_n()
  );

endmodule
