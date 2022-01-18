select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,item i,warehouse w,ship_mode sm
where ws.ws_order_number = wr.wr_order_number and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 206 and ws.ws_hash <= 956 and i.i_hash >= 176 and i.i_hash <= 509 and sm.sm_hash >= 429 and sm.sm_hash <= 829
;
