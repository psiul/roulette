select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,date_dim d,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and sm.sm_hash >= 52 and sm.sm_hash <= 802 and hd.hd_hash >= 484 and hd.hd_hash <= 884 and d.d_hash >= 15 and d.d_hash <= 348
;
