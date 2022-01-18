select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,household_demographics hd,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 220 and ws.ws_hash <= 553 and hd.hd_hash >= 129 and hd.hd_hash <= 879 and d.d_hash >= 576 and d.d_hash <= 976
;
