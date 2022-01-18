select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,customer c,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 333 and ws.ws_hash <= 733 and d.d_hash >= 112 and d.d_hash <= 862 and c.c_hash >= 281 and c.c_hash <= 614
;
