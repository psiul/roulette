select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,item i,date_dim d,warehouse w
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 383 and ws.ws_hash <= 783 and sm.sm_hash >= 128 and sm.sm_hash <= 878 and i.i_hash >= 396 and i.i_hash <= 729
;
