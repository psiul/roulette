select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,item i,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 304 and ws.ws_hash <= 704 and i.i_hash >= 141 and i.i_hash <= 891 and c.c_hash >= 543 and c.c_hash <= 876
;
