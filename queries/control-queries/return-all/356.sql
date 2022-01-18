select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,warehouse w,web_returns wr
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 12 and ws.ws_hash <= 762 and i.i_hash >= 484 and i.i_hash <= 884 and hd.hd_hash >= 257 and hd.hd_hash <= 590
;
