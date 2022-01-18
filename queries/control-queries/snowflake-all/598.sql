select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,warehouse w,customer c
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 96 and ws.ws_hash <= 846 and d.d_hash >= 287 and d.d_hash <= 687 and c.c_hash >= 498 and c.c_hash <= 831
;
