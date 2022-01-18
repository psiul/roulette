select count(ws.ws_item_sk)
from web_sales ws,customer c,ship_mode sm,household_demographics hd,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 264 and ws.ws_hash <= 664 and c.c_hash >= 471 and c.c_hash <= 804 and hd.hd_hash >= 32 and hd.hd_hash <= 782
;
