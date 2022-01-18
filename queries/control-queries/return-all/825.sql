select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,warehouse w,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and d.d_hash >= 184 and d.d_hash <= 934 and sm.sm_hash >= 74 and sm.sm_hash <= 407 and c.c_hash >= 334 and c.c_hash <= 734
;
