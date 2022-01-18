select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,customer c,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and sm.sm_hash >= 551 and sm.sm_hash <= 951 and d.d_hash >= 90 and d.d_hash <= 840 and i.i_hash >= 654 and i.i_hash <= 987
;
