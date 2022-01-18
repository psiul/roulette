select count(ws.ws_item_sk)
from web_sales ws,customer c,ship_mode sm,date_dim d,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 395 and c.c_hash <= 728 and sm.sm_hash >= 62 and sm.sm_hash <= 812 and hd.hd_hash >= 226 and hd.hd_hash <= 626
;
