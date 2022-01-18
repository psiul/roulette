select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,customer c,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 472 and ws.ws_hash <= 805 and c.c_hash >= 396 and c.c_hash <= 796 and d.d_hash >= 200 and d.d_hash <= 950
;
