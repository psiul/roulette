select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,date_dim d,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 254 and ws.ws_hash <= 587 and hd.hd_hash >= 21 and hd.hd_hash <= 421 and d.d_hash >= 222 and d.d_hash <= 972
;
