select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,item i,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and d.d_hash >= 441 and d.d_hash <= 774 and i.i_hash >= 23 and i.i_hash <= 773 and c.c_hash >= 353 and c.c_hash <= 753
;
