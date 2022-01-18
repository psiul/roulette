select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer c,warehouse w
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 99 and ws.ws_hash <= 432 and d.d_hash >= 164 and d.d_hash <= 914 and i.i_hash >= 446 and i.i_hash <= 846
;
