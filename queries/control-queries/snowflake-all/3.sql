select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,item i,customer c,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and i.i_hash >= 393 and i.i_hash <= 726 and c.c_hash >= 206 and c.c_hash <= 956 and d.d_hash >= 41 and d.d_hash <= 441
;
