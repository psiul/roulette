select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,household_demographics hd,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and sm.sm_hash >= 53 and sm.sm_hash <= 803 and hd.hd_hash >= 534 and hd.hd_hash <= 867 and c.c_hash >= 579 and c.c_hash <= 979
;
