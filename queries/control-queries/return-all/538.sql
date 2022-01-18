select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,date_dim d,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 183 and ws.ws_hash <= 933 and c.c_hash >= 462 and c.c_hash <= 862 and d.d_hash >= 539 and d.d_hash <= 872
;
