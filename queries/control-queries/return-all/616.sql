select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,item i,web_returns wr
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 100 and ws.ws_hash <= 850 and sm.sm_hash >= 430 and sm.sm_hash <= 763 and i.i_hash >= 167 and i.i_hash <= 567
;
