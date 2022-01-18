select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,item i,warehouse w
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and sm.sm_hash >= 164 and sm.sm_hash <= 914 and d.d_hash >= 550 and d.d_hash <= 950 and i.i_hash >= 45 and i.i_hash <= 378
;
