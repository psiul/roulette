select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,household_demographics hd,warehouse w
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 144 and d.d_hash <= 477 and c.c_hash >= 64 and c.c_hash <= 814 and hd.hd_hash >= 485 and hd.hd_hash <= 885
;
