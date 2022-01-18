select count(ws.ws_item_sk)
from web_sales ws,customer c,web_returns wr,item i,ship_mode sm
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 131 and ws.ws_hash <= 881 and i.i_hash >= 468 and i.i_hash <= 801 and sm.sm_hash >= 339 and sm.sm_hash <= 739
;
