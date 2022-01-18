select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,ship_mode sm,customer c
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and d.d_hash >= 351 and d.d_hash <= 751 and sm.sm_hash >= 301 and sm.sm_hash <= 634 and c.c_hash >= 176 and c.c_hash <= 926
;
