select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,web_returns wr,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 113 and ws.ws_hash <= 513 and i.i_hash >= 170 and i.i_hash <= 920 and c.c_hash >= 321 and c.c_hash <= 654
;
