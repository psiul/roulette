select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,customer c,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 114 and d.d_hash <= 514 and c.c_hash >= 165 and c.c_hash <= 915 and hd.hd_hash >= 111 and hd.hd_hash <= 444
;
