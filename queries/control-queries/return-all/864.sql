select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,ship_mode sm,customer c
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and i.i_hash >= 379 and i.i_hash <= 779 and d.d_hash >= 81 and d.d_hash <= 414 and sm.sm_hash >= 49 and sm.sm_hash <= 799
;
