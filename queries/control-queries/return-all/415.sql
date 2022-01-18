select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,ship_mode sm,date_dim d,household_demographics hd
where ws.ws_order_number = wr.wr_order_number and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and wr.wr_returned_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and sm.sm_hash >= 64 and sm.sm_hash <= 397 and d.d_hash >= 85 and d.d_hash <= 835 and hd.hd_hash >= 40 and hd.hd_hash <= 440
;
