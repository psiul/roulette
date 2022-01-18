select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,warehouse w,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and d.d_hash >= 93 and d.d_hash <= 426 and sm.sm_hash >= 166 and sm.sm_hash <= 916 and i.i_hash >= 187 and i.i_hash <= 587
;
