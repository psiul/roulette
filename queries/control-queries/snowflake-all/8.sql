select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,date_dim d,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and i.i_hash >= 289 and i.i_hash <= 622 and d.d_hash >= 107 and d.d_hash <= 857 and c.c_hash >= 221 and c.c_hash <= 621
;
