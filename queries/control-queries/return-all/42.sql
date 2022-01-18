select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,date_dim d,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 224 and ws.ws_hash <= 557 and d.d_hash >= 406 and d.d_hash <= 806 and i.i_hash >= 43 and i.i_hash <= 793
;
