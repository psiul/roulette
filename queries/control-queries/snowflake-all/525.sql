select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,customer c,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 487 and ws.ws_hash <= 820 and d.d_hash >= 236 and d.d_hash <= 986 and hd.hd_hash >= 447 and hd.hd_hash <= 847
;
