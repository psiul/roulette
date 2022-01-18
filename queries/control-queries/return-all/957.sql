select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,household_demographics hd,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 509 and ws.ws_hash <= 909 and sm.sm_hash >= 321 and sm.sm_hash <= 654 and c.c_hash >= 215 and c.c_hash <= 965
;
