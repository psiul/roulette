select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,item i,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and sm.sm_hash >= 557 and sm.sm_hash <= 890 and i.i_hash >= 274 and i.i_hash <= 674 and d.d_hash >= 30 and d.d_hash <= 780
;
