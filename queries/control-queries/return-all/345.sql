select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,household_demographics hd,ship_mode sm
where ws.ws_order_number = wr.wr_order_number and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 500 and d.d_hash <= 900 and hd.hd_hash >= 518 and hd.hd_hash <= 851 and sm.sm_hash >= 179 and sm.sm_hash <= 929
;
