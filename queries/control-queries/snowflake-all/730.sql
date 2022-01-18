select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,date_dim d,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 159 and ws.ws_hash <= 492 and hd.hd_hash >= 161 and hd.hd_hash <= 911 and d.d_hash >= 367 and d.d_hash <= 767
;
