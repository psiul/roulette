select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,household_demographics hd,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 230 and ws.ws_hash <= 563 and hd.hd_hash >= 122 and hd.hd_hash <= 872 and d.d_hash >= 143 and d.d_hash <= 543
;
