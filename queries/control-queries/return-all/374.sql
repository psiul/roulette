select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,household_demographics hd,web_returns wr
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 297 and ws.ws_hash <= 630 and c.c_hash >= 85 and c.c_hash <= 835 and hd.hd_hash >= 170 and hd.hd_hash <= 570
;
