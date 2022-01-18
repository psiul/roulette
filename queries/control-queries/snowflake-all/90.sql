select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,ship_mode sm,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 14 and ws.ws_hash <= 347 and i.i_hash >= 287 and i.i_hash <= 687 and sm.sm_hash >= 188 and sm.sm_hash <= 938
;
