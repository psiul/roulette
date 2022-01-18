select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,item i,warehouse w,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 159 and ws.ws_hash <= 559 and i.i_hash >= 145 and i.i_hash <= 895 and c.c_hash >= 265 and c.c_hash <= 598
;
