select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,ship_mode sm,item i
where ws.ws_order_number = wr.wr_order_number and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and wr.wr_item_sk = i.i_item_sk and ws.ws_hash >= 479 and ws.ws_hash <= 812 and d.d_hash >= 62 and d.d_hash <= 812 and sm.sm_hash >= 190 and sm.sm_hash <= 590
;
