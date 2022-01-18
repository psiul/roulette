select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,web_returns wr,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 75 and ws.ws_hash <= 825 and sm.sm_hash >= 228 and sm.sm_hash <= 561 and i.i_hash >= 344 and i.i_hash <= 744
;
