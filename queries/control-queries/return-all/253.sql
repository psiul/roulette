select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,item i,warehouse w
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and c.c_hash >= 263 and c.c_hash <= 596 and d.d_hash >= 157 and d.d_hash <= 557 and i.i_hash >= 13 and i.i_hash <= 763
;
