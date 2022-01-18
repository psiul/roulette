select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,customer c,ship_mode sm
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 123 and d.d_hash <= 873 and hd.hd_hash >= 56 and hd.hd_hash <= 389 and c.c_hash >= 165 and c.c_hash <= 565
;
