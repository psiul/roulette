select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,warehouse w,item i
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 40 and ws.ws_hash <= 790 and d.d_hash >= 238 and d.d_hash <= 571 and i.i_hash >= 391 and i.i_hash <= 791
;
