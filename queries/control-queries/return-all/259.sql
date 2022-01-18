select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,ship_mode sm,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 224 and ws.ws_hash <= 974 and d.d_hash >= 44 and d.d_hash <= 377 and c.c_hash >= 503 and c.c_hash <= 903
;
