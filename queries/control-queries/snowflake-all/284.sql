select count(ws.ws_item_sk)
from web_sales ws,item i,customer c,date_dim d,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 62 and ws.ws_hash <= 812 and c.c_hash >= 497 and c.c_hash <= 830 and d.d_hash >= 247 and d.d_hash <= 647
;
