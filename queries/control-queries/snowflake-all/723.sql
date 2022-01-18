select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,warehouse w,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and sm.sm_hash >= 44 and sm.sm_hash <= 794 and d.d_hash >= 228 and d.d_hash <= 561 and c.c_hash >= 188 and c.c_hash <= 588
;
