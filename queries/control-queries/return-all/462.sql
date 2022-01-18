select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,item i,web_returns wr,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_returned_date_sk = d.d_date_sk and sm.sm_hash >= 58 and sm.sm_hash <= 808 and i.i_hash >= 327 and i.i_hash <= 727 and d.d_hash >= 482 and d.d_hash <= 815
;
