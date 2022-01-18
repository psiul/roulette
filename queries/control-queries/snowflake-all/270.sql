select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,customer c,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 356 and ws.ws_hash <= 689 and d.d_hash >= 9 and d.d_hash <= 759 and c.c_hash >= 244 and c.c_hash <= 644
;
