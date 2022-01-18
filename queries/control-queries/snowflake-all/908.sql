select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,household_demographics hd,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and c.c_hash >= 33 and c.c_hash <= 783 and hd.hd_hash >= 565 and hd.hd_hash <= 965 and d.d_hash >= 640 and d.d_hash <= 973
;
