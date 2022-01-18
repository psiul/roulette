select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,customer c,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 59 and ws.ws_hash <= 809 and c.c_hash >= 23 and c.c_hash <= 423 and sm.sm_hash >= 71 and sm.sm_hash <= 404
;
