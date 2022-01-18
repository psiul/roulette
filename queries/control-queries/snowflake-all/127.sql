select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,ship_mode sm,date_dim d,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 59 and ws.ws_hash <= 809 and hd.hd_hash >= 107 and hd.hd_hash <= 507 and sm.sm_hash >= 565 and sm.sm_hash <= 898
;
