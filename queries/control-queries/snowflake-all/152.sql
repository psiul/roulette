select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,ship_mode sm,item i
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 138 and ws.ws_hash <= 888 and d.d_hash >= 24 and d.d_hash <= 424 and sm.sm_hash >= 417 and sm.sm_hash <= 750
;
