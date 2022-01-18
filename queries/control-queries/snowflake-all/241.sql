select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer c,warehouse w
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 506 and ws.ws_hash <= 839 and i.i_hash >= 454 and i.i_hash <= 854 and c.c_hash >= 67 and c.c_hash <= 817
;
