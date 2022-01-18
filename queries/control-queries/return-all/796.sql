select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,household_demographics hd,ship_mode sm,date_dim d
where ws.ws_order_number = wr.wr_order_number and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and wr.wr_returned_date_sk = d.d_date_sk and ws.ws_hash >= 159 and ws.ws_hash <= 909 and sm.sm_hash >= 69 and sm.sm_hash <= 402 and d.d_hash >= 187 and d.d_hash <= 587
;
