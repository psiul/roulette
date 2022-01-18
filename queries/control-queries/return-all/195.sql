select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,ship_mode sm,customer c
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and d.d_hash >= 93 and d.d_hash <= 493 and sm.sm_hash >= 512 and sm.sm_hash <= 845 and c.c_hash >= 209 and c.c_hash <= 959
;
