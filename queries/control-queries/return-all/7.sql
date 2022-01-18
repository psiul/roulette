select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,warehouse w,item i
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 182 and ws.ws_hash <= 582 and d.d_hash >= 274 and d.d_hash <= 607 and sm.sm_hash >= 85 and sm.sm_hash <= 835
;
