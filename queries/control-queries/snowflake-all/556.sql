select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,customer c,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 240 and ws.ws_hash <= 990 and sm.sm_hash >= 229 and sm.sm_hash <= 562 and i.i_hash >= 373 and i.i_hash <= 773
;
