select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,ship_mode sm,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and hd.hd_hash >= 156 and hd.hd_hash <= 489 and d.d_hash >= 92 and d.d_hash <= 842 and c.c_hash >= 76 and c.c_hash <= 476
;
