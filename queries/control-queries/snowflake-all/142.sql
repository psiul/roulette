select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,ship_mode sm,customer c
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 216 and ws.ws_hash <= 616 and d.d_hash >= 172 and d.d_hash <= 505 and sm.sm_hash >= 5 and sm.sm_hash <= 755
;
