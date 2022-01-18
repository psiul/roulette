select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,household_demographics hd,web_returns wr
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 248 and ws.ws_hash <= 648 and i.i_hash >= 221 and i.i_hash <= 554 and hd.hd_hash >= 110 and hd.hd_hash <= 860
;
