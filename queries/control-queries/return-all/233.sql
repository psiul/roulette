select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,warehouse w,item i
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 357 and ws.ws_hash <= 757 and hd.hd_hash >= 14 and hd.hd_hash <= 347 and i.i_hash >= 36 and i.i_hash <= 786
;
