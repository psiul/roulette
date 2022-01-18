select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,customer c,item i
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 375 and ws.ws_hash <= 708 and d.d_hash >= 183 and d.d_hash <= 933 and c.c_hash >= 301 and c.c_hash <= 701
;
