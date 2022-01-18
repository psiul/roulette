select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,customer c,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 503 and d.d_hash <= 903 and c.c_hash >= 176 and c.c_hash <= 509 and hd.hd_hash >= 48 and hd.hd_hash <= 798
;
