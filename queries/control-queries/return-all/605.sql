select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,household_demographics hd,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 155 and ws.ws_hash <= 905 and d.d_hash >= 98 and d.d_hash <= 431 and hd.hd_hash >= 544 and hd.hd_hash <= 944
;
