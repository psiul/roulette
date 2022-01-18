select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,item i,customer c
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and sm.sm_hash >= 396 and sm.sm_hash <= 729 and i.i_hash >= 418 and i.i_hash <= 818 and c.c_hash >= 104 and c.c_hash <= 854
;
