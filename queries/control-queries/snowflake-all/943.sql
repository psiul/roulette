select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,warehouse w,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 109 and ws.ws_hash <= 859 and sm.sm_hash >= 20 and sm.sm_hash <= 353 and c.c_hash >= 168 and c.c_hash <= 568
;
