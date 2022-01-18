select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,date_dim d,web_returns wr
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 552 and ws.ws_hash <= 885 and hd.hd_hash >= 408 and hd.hd_hash <= 808 and d.d_hash >= 94 and d.d_hash <= 844
;
