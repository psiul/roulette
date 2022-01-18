select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,ship_mode sm,warehouse w
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and c.c_hash >= 186 and c.c_hash <= 936 and d.d_hash >= 247 and d.d_hash <= 580 and sm.sm_hash >= 479 and sm.sm_hash <= 879
;
