select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,web_returns wr,warehouse w,item i
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_warehouse_sk = w.w_warehouse_sk and wr.wr_item_sk = i.i_item_sk and ws.ws_hash >= 31 and ws.ws_hash <= 431 and hd.hd_hash >= 176 and hd.hd_hash <= 509 and i.i_hash >= 86 and i.i_hash <= 836
;
