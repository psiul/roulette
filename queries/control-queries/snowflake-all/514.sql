select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,ship_mode sm,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 178 and ws.ws_hash <= 928 and d.d_hash >= 19 and d.d_hash <= 419 and hd.hd_hash >= 544 and hd.hd_hash <= 877
;
