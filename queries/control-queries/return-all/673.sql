select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,item i,date_dim d,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 226 and ws.ws_hash <= 626 and i.i_hash >= 220 and i.i_hash <= 970 and d.d_hash >= 181 and d.d_hash <= 514
;
