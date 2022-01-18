select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,item i,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and sm.sm_hash >= 85 and sm.sm_hash <= 835 and i.i_hash >= 208 and i.i_hash <= 541 and d.d_hash >= 504 and d.d_hash <= 904
;
