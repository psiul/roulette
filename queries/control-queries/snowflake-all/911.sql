select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,date_dim d,ship_mode sm
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and i.i_hash >= 440 and i.i_hash <= 840 and d.d_hash >= 129 and d.d_hash <= 462 and sm.sm_hash >= 167 and sm.sm_hash <= 917
;
