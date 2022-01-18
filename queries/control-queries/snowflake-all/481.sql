select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,item i,warehouse w
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 365 and ws.ws_hash <= 765 and sm.sm_hash >= 8 and sm.sm_hash <= 341 and i.i_hash >= 161 and i.i_hash <= 911
;
