select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,warehouse w,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 203 and ws.ws_hash <= 536 and i.i_hash >= 519 and i.i_hash <= 919 and sm.sm_hash >= 144 and sm.sm_hash <= 894
;
