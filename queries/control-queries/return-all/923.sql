select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,warehouse w,household_demographics hd
where ws.ws_order_number = wr.wr_order_number and wr.wr_returned_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 26 and ws.ws_hash <= 776 and d.d_hash >= 336 and d.d_hash <= 669 and hd.hd_hash >= 300 and hd.hd_hash <= 700
;
