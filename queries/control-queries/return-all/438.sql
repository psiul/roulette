select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer c,warehouse w,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 286 and ws.ws_hash <= 619 and c.c_hash >= 125 and c.c_hash <= 875 and d.d_hash >= 14 and d.d_hash <= 414
;
