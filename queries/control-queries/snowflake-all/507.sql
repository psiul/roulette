select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,warehouse w,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 317 and ws.ws_hash <= 717 and c.c_hash >= 495 and c.c_hash <= 828 and d.d_hash >= 140 and d.d_hash <= 890
;
