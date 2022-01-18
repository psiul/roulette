select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,customer c,warehouse w
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 210 and ws.ws_hash <= 543 and d.d_hash >= 249 and d.d_hash <= 999 and c.c_hash >= 152 and c.c_hash <= 552
;
