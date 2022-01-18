select count(ws.ws_item_sk)
from web_sales ws,customer c,warehouse w,date_dim d,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 338 and ws.ws_hash <= 738 and c.c_hash >= 111 and c.c_hash <= 861 and d.d_hash >= 404 and d.d_hash <= 737
;
