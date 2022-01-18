select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,ship_mode sm,web_returns wr
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 300 and ws.ws_hash <= 633 and hd.hd_hash >= 550 and hd.hd_hash <= 950 and sm.sm_hash >= 247 and sm.sm_hash <= 997
;
