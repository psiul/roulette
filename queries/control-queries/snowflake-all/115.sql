select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,household_demographics hd,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and i.i_hash >= 455 and i.i_hash <= 855 and d.d_hash >= 0 and d.d_hash <= 750 and hd.hd_hash >= 485 and hd.hd_hash <= 818
;
