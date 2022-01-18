select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,item i,ship_mode sm
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 142 and d.d_hash <= 475 and c.c_hash >= 523 and c.c_hash <= 923 and sm.sm_hash >= 39 and sm.sm_hash <= 789
;
