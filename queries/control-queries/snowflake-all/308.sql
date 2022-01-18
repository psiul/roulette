select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,warehouse w,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 444 and ws.ws_hash <= 844 and sm.sm_hash >= 335 and sm.sm_hash <= 668 and d.d_hash >= 164 and d.d_hash <= 914
;
